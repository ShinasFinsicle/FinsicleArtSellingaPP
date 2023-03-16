import 'package:add/constants/constant_colors.dart';
import 'package:add/pages/cart/wigets/cart_list_tile.dart';
import 'package:add/pages/cart/wigets/payment_selection.dart';
import 'package:add/pages/cart/wigets/total_price_tile.dart';
import 'package:add/provider/art/art_details_provider.dart';
import 'package:add/provider/payment_provider/payment_selector_provider.dart';
import 'package:add/provider/user/address_model_provider.dart';
import 'dart:convert';
import 'package:add/widgets/buttons/my_button.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../functions/alert_popup.dart';
import '../../shipment/razor_credentials.dart' as razorCredentials;
import '../../shipment/widgets/address_tile.dart';
import '../cash_on_delivery/cash_sucess.dart';

class Cart extends StatefulWidget {
  const Cart({
    super.key,
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response);
    verifySignature(
      signature: response.signature,
      paymentId: response.paymentId,
      orderId: response.orderId,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response);
    AlertPopup.alertPopup(context,
        message: response.message ?? '',
        color: Colors.red,
        icon: Icons.production_quantity_limits_rounded);
    // Do something when payment fails
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(response.message ?? ''),
    //   ),
    // );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response);
    // Do something when an external wallet is selected
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.walletName ?? ''),
      ),
    );
  }

// create order
  void createOrder() async {
    String username = razorCredentials.keyId;
    String password = razorCredentials.keySecret;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    Map<String, dynamic> body = {
      "amount": 1000,
      "currency": "INR",
      "receipt": "rcptid_11"
    };
    var res = await http.post(
      Uri.https(
          "api.razorpay.com", "v1/orders"), //https://api.razorpay.com/v1/orders
      headers: <String, String>{
        "Content-Type": "application/json",
        'authorization': basicAuth,
      },
      body: jsonEncode(body),
    );

    if (res.statusCode == 200) {
      openGateway(jsonDecode(res.body)['id']);
    }
    print(res.body);
  }

  openGateway(String orderId) {
    var options = {
      'key': razorCredentials.keyId,
      'amount': 100, //in the smallest currency sub-unit.
      'name': 'Finsicle',
      'order_id': orderId, // Generate order_id using Orders API
      'description': 'art',
      'timeout': 60 * 5, // in seconds // 5 minutes
      'prefill': {
        'contact': '9123456789',
        'email': 'shinas@gmail.com.com',
      }
    };
    _razorpay.open(options);
  }

  verifySignature({
    String? signature,
    String? paymentId,
    String? orderId,
  }) async {
    Map<String, dynamic> body = {
      'razorpay_signature': signature,
      'razorpay_payment_id': paymentId,
      'razorpay_order_id': orderId,
    };

    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    var res = await http.post(
      Uri.https(
        "10.0.2.2", // my ip address , localhost
        "razorpay_signature_verify.php",
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    print(res.body);
    if (res.statusCode == 200) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.body),
        ),
      );
    }
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(
              Icons.shopping_cart_checkout,
              color: Color(0xff40bfff),
            ),
            SizedBox(
              width: 1,
            ),
            Text('Order Summary'),
          ],
        ),
      ),
      body: Consumer<AddressDetailsProvider>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0), child: CartListTile()),
              const SizedBox(
                height: 20,
              ),
              AddressTile(
                  buildingname: value.addressModel!.buildingname,
                  city: value.addressModel!.city,
                  name: value.addressModel!.name,
                  phonenmuber: value.addressModel!.phonenumber,
                  pincode: value.addressModel!.pincode,
                  state: value.addressModel!.state),
              const SizedBox(
                height: 20,
              ),
              const TotalPriceTile(),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(22.0, 0, 0, 0),
                child: PaymentMethodSelection(),
              ),
              Mybutton(
                  label: "Check Out",
                  ontap: () {
                    String? _pay = Provider.of<PaymentSelectionProvider>(
                            context,
                            listen: false)
                        .selectedPaymentMedthod;

                    if (_pay != null) {
                      if (_pay == "Cash on Delivery") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CashSucessScreen()));
                      } else {
                        createOrder();
                      }
                    } else {
                      AlertPopup.alertPopup(context,
                          message: "Select Payment Metod",
                          color: Colors.red,
                          icon: Icons.paypal_sharp);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
