import 'package:add/pages/receivedorders/widget/status_selector.dart';
import 'package:add/pages/track_your_order/functions/contact_to_artist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/constant_colors.dart';
import '../../../widgets/buttons/coustom_elevated_button.dart';
import '../../../widgets/drawer/divider.dart';

class ReceivedOrderTile extends StatelessWidget {
  const ReceivedOrderTile({
    super.key,
    required this.artName,
    required this.orderDate,
    required this.buyerAddressUid,
    required this.artId,
    required this.orderstatus,
  });
  final String artName;
  final Timestamp orderDate;
  final String buyerAddressUid;
  final String artId;
  final String orderstatus;
  @override
  Widget build(BuildContext context) {
    final day = orderDate.toDate().day;
    final month = orderDate.toDate().month;
    final year = orderDate.toDate().year;
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: 343,
        height: (MediaQuery.of(context).size.height * 0.70),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color(0xffeaefff),
            width: 1,
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                artName,
                style: TextStyle(
                  color: kPrimaryTextcolor,
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.50,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Mode of payment: Cash on delivery",
                style: TextStyle(
                  color: Color(0xff9098b1),
                  fontSize: 12,
                  letterSpacing: 0.50,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Order at :  $day-$month-$year",
                style: TextStyle(
                  color: Color(0xff9098b1),
                  fontSize: 12,
                  letterSpacing: 0.50,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Order Status: $orderstatus",
                style: TextStyle(
                  color: Color(0xff9098b1),
                  fontSize: 12,
                  letterSpacing: 0.50,
                ),
              ),
              dividerWidget(),
              Expanded(
                child: ShipmentAddressBuilder(
                  buyerAddressdUId: buyerAddressUid,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              dividerWidget(),
              Row(
                children: [
                  Text(
                    "Contact Buyer",
                    style: TextStyle(
                      color: Color(0xff9098b1),
                      fontSize: 12,
                      letterSpacing: 0.50,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.54),
                  IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      icon: const FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        ContactArtist.openWhatsapp('9633005917');
                      }),
                ],
              ),
              dividerWidget(),
              Center(
                child: CoustomElevatedButoon(
                    label: 'Update Status',
                    ontap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Change Status',
                              style: TextStyle(
                                  fontSize: 15, color: kPrimaryTextcolor),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  StatusUpdater(
                                    artId: artId,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    backGroundColor: kPrimaryTextcolor),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShipmentAddressBuilder extends StatelessWidget {
  const ShipmentAddressBuilder({
    super.key,
    required this.buyerAddressdUId,
  });
  final String buyerAddressdUId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('user')
          .where('addressUid', isEqualTo: buyerAddressdUId)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data?.docs.isEmpty != true) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  final Details = snapshot.data?.docs[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipment Address :-',
                        style: TextStyle(
                          color: kPrimaryTextcolor,
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.50,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        Details['name'],
                        style: TextStyle(
                          color: kPrimaryTextcolor,
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.50,
                        ),
                      ),
                      Text(
                        "${Details['buildingname']} \n${Details['city']}  \n${Details['state']} \nPincode:-${Details['pincode']} ",
                        style: TextStyle(
                          color: Color(0xff9098b1),
                          fontSize: 12,
                          letterSpacing: 0.50,
                        ),
                      ),
                      Text(
                        "Phone Number:- ${Details['phonenmuber']} ",
                        style: TextStyle(
                          color: Color(0xff9098b1),
                          fontSize: 12,
                          letterSpacing: 0.50,
                        ),
                      ),
                    ],
                  );
                });
          }
        } else {
          return const Center(child: Text('No orders'));
        }
        return const Center(
          child: Text('No orders'),
        );
      },
    );
  }
}
