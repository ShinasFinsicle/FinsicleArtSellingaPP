import 'package:add/constants/constant_colors.dart';
import 'package:add/functions/alert_functions.dart';
import 'package:add/pages/authpage/google_auth.dart';
import 'package:add/provider/google_signin.dart';
import 'package:add/widgets/buttons/coustom_elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });

  final _user = FirebaseAuth.instance.currentUser!;

  Widget userInfo({required IconData icon, required String content}) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: Text(
            content,
            style: const TextStyle(color: kPrimaryTextcolor),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<GoogleSignProvider>(
      builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Profile '),
            backgroundColor: Colors.white,
            elevation: 1,
          ),
          body: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      Card(
                        color: Colors.white70,
                        margin: const EdgeInsets.all(30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  _user.displayName!,
                                  style: const TextStyle(
                                      fontSize: 24.0,
                                      fontFamily: ('Poppins'),
                                      color: kPrimaryTextcolor),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Account Information :',
                                  style: TextStyle(
                                      fontSize: 15, color: kPrimaryTextcolor),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: userInfo(
                                    icon: Icons.email, content: _user.email!),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * 0.26,
                            height: size.width * 0.26,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border: Border.all(color: kPrimaryTextcolor),
                                image: DecorationImage(
                                    image: NetworkImage(_user.photoURL!),
                                    fit: BoxFit.fill)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              CoustomElevatedButoon(
                  label: 'Log out',
                  ontap: () {
                    showAlerttoUser(context, 'Are You Sure Wants to log out?  ',
                        onpressed: () async {
                      value.logout();
                      // ignore: use_build_context_synchronously
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const GoogleAuthPage()));
                    });
                  },
                  backGroundColor: kPrimaryTextcolor)
            ],
          )),
    );
  }
}
