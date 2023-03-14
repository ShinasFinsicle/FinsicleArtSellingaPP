import 'package:add/constants/constant_colors.dart';
import 'package:add/pages/cart/wigets/cart_list_tile.dart';
import 'package:add/pages/cart/wigets/total_price_tile.dart';
import 'package:add/shipment/shipment.dart';
import 'package:add/widgets/buttons/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Cart extends StatelessWidget {
  const Cart(
      {super.key,
      required this.imgUrlCrt,
      required this.artNameCrt,
      required this.artPriceCrt});
  final String imgUrlCrt;
  final String artNameCrt;
  final String artPriceCrt;
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
            Text('Your Cart'),
          ],
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CartListTile(
                    artNameCrt: artNameCrt,
                    artPriceCrt: artPriceCrt,
                    imgUrlCrt: imgUrlCrt,
                  )),
              const SizedBox(
                height: 20,
              ),
              const TotalPriceTile(),
              const SizedBox(
                height: 20,
              ),
              Mybutton(
                  label: "Check Out",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Shipment()));
                  })
            ],
          ),
        ],
      ),
    );
  }
}
