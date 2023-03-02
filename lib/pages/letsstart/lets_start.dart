import 'package:add/constants/text.dart/sizedboxwidget.dart';
import 'package:add/constants/text.dart/text.dart';
import 'package:flutter/material.dart';

import '../authpage/google_auth.dart';

class LetsStart extends StatelessWidget {
  const LetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff40bfff),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/singleiconWhite.png'),
              kSizedBox10,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GoogleAuthPage(),
                      ));
                },
                child: Text(
                  kLetsStart,
                  style: kfontstyle17(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
