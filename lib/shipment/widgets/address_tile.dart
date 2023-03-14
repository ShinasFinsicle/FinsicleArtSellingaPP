import 'package:add/constants/constant_colors.dart';
import 'package:flutter/material.dart';

import 'edit_button.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            "Shinas Nazeer",
            style: TextStyle(
              color: kPrimaryTextcolor,
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              letterSpacing: 0.50,
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 295,
            child: Text(
              "Liya Manzil,\nperumbaikadu p.o,\nkottayam -68",
              style: TextStyle(
                color: Color(0xff9098b1),
                fontSize: 12,
                letterSpacing: 0.50,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "+91 9633005917",
            style: TextStyle(
              color: Color(0xff9098b1),
              fontSize: 12,
              letterSpacing: 0.50,
            ),
          ),
          SizedBox(height: 16),
          EditButton(
            onTap: () {
              print("Edit Button Pressed");
            },
          ),
        ],
      ),
    );
  }
}
