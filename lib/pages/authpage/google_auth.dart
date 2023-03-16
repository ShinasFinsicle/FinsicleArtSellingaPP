import 'package:add/constants/constant_text.dart';
import 'package:add/pages/authpage/widget/google_button.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../constants/constant_sizedbox.dart';
import '../../provider/auth_provider/google_sign_provider.dart';

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
                InkWell(
                    onTap: () async {
                      value.loadingchanger();
                      await value.googleLogin1(context);
                      value.loadingchanger();
                    },
                    child: const GoogleButton())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
