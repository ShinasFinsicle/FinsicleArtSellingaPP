import 'package:add/constants/constant_colors.dart';
import 'package:add/provider/auth_provider/google_sign_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleSignProvider>(
        builder: (context, value, child) => !value.loading
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color(0xffeaefff),
                    width: 1,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 30,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                "assets/images/Google.png",
                                width: 20,
                                height: 20,
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const SizedBox(
                      width: 277,
                      child: Text(
                        "Login with Google",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff9098b1),
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.50,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const CircularProgressIndicator(
                backgroundColor: kPrimaryTextcolor,
              ));
  }
}
