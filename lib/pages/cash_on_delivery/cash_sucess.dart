import 'package:add/constants/constant_colors.dart';
import 'package:add/constants/constant_sizedbox.dart';
import 'package:add/pages/art/artlist_page.dart';
import 'package:add/widgets/buttons/my_button.dart';
import 'package:flutter/material.dart';

class CashSucessScreen extends StatelessWidget {
  const CashSucessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_sharp,
                color: kBackgroundcolor,
                size: 90,
              ),
              const Text(
                "Success",
                style: TextStyle(
                  color: kPrimaryTextcolor,
                  fontSize: 24,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.50,
                ),
              ),
              kSizedBox20,
              Mybutton(
                  label: "Back to home",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ArtlistScreen()));
                  })
            ],
          ),
        ],
      ),
    );
  }
}
