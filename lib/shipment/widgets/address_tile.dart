import 'package:add/constants/constant_colors.dart';
import 'package:add/provider/user/address_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_button.dart';

class AddressTile extends StatelessWidget {
  const AddressTile(
      {super.key,
      required this.name,
      required this.buildingname,
      required this.city,
      required this.phonenmuber,
      required this.pincode,
      required this.state});
  final String name;
  final String buildingname;
  final String city;
  final String phonenmuber;
  final String pincode;
  final String state;
  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(
        builder: (context, value, child) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: kBackgroundcolor,
                  width: 1,
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: kBackgroundcolor,
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.50,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 295,
                    child: Text(
                      "$buildingname,\n$city,\n$state, \npincode:$pincode",
                      style: const TextStyle(
                        color: Color(0xff9098b1),
                        fontSize: 12,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    phonenmuber,
                    style: const TextStyle(
                      color: Color(0xff9098b1),
                      fontSize: 12,
                      letterSpacing: 0.50,
                    ),
                  ),
                  const SizedBox(height: 16),
                  EditButton(
                    onTap: () {
                      print("Edit Button Pressed");
                    },
                  ),
                ],
              ),
            ));
  }
}
