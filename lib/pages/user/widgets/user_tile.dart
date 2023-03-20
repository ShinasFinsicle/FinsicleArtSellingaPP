import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/constant_colors.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required User user,
  }) : _user = user;

  final User _user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        // backgroundImage: NetworkImage(_user.photoURL!),
      ),
      title: Text(
        _user.displayName == null ? "Admin" : _user.displayName!,
        style: const TextStyle(
          fontSize: 15,
          color: kPrimaryTextcolor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        _user.email!,
        style: const TextStyle(
          color: Color(0xff9098b1),
          fontSize: 12,
          letterSpacing: 0.50,
        ),
      ),
    );
  }
}
