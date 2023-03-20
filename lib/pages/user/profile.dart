import 'package:add/functions/alert_functions.dart';
import 'package:add/pages/admin/admin_uid.dart';
import 'package:add/pages/user/widgets/user_tile.dart';
import 'package:add/provider/auth_provider/google_sign_provider.dart';
import 'package:add/widgets/buttons/coustom_elevated_button.dart';
import 'package:add/widgets/buttons/my_button.dart';
import 'package:add/widgets/drawer/divider.dart';
import 'package:add/widgets/drawer/drawer_Items_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constant_colors.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final _user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<GoogleSignProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: Column(
          children: [
            UserTile(user: _user),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              leading: Icon(
                Icons.phone_android_sharp,
                color: kBackgroundcolor,
                size: 30,
              ),
              title: Text(
                "Phone",
                style: TextStyle(
                  color: Color(0xff223263),
                  fontSize: 12,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.50,
                ),
              ),
              trailing: Text(
                "+91 9633005917",
                style: TextStyle(
                  color: Color(0xff9098b1),
                  fontSize: 12,
                  letterSpacing: 0.50,
                ),
              ),
            ),
            CoustomElevatedButoon(
                label: "Log out",
                ontap: () {
                  showAlerttoUser(context, "Are you sure want to log out?",
                      onpressed: () {
                    _user.uid == adminUid
                        ? value.adminlogout(context)
                        : value.logout(context);
                  });
                },
                backGroundColor: kPrimaryTextcolor)
          ],
        ),
      ),
    );
  }
}
