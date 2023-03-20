import 'package:add/constants/constant_colors.dart';
import 'package:add/functions/alert_popup.dart';
import 'package:add/pages/art/artlist_page.dart';
import 'package:add/widgets/buttons/my_button.dart';
import 'package:add/widgets/posting_text_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../functions/validate.dart';

class AdminLoginPage extends StatelessWidget {
  AdminLoginPage({super.key});
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Icon(
                  Icons.admin_panel_settings,
                  size: 200,
                  color: kPrimaryTextcolor,
                ),
                PostingTextform(
                  textController: _username,
                  headLineText: "Enter your user Name",
                  hintText: 'User name',
                  validator: (value) => validatefields(value),
                ),
                PostingTextform(
                  textController: _password,
                  headLineText: "Enter your Password",
                  hintText: 'Password',
                  validator: (value) => validatefields(value),
                ),
                Mybutton(
                    label: "Login",
                    ontap: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await _auth.signInWithEmailAndPassword(
                              email: _username.text, password: _password.text);
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ArtlistScreen()),
                          );
                        } catch (e) {
                          AlertPopup.alertPopup(context,
                              message: "Incorrect Credentials",
                              color: Colors.red,
                              icon: Icons.login);
                        }
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
