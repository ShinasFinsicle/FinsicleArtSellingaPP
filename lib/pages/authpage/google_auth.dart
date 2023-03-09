import 'package:add/constants/constant_text.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../constants/constant_sizedbox.dart';
import '../../provider/google_signin.dart';

class GoogleAuthPage extends StatelessWidget {
  const GoogleAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GoogleSignProvider>(
        builder: (context, value, child) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Icon.png"),
                kSizedBox15,
                const Text(
                  kWelcome,
                  style: TextStyle(
                      color: Color(0xff223263),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: ('Poppins')),
                ),
                kSizedBox15,
                const Text(
                  kSignin,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: ('Poppins reg')),
                ),
                kSizedBox20,
                SignInButton(
                  Buttons.google,
                  onPressed: () {
                    value.googleLogin1();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
