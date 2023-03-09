// ignore: file_names
import 'package:add/constants/constant_colors.dart';
import 'package:flutter/material.dart';

class DrawerItemsWidget extends StatelessWidget {
  const DrawerItemsWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.ontap,
  });
  final Icon icon;
  final String title;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        iconColor: kBackgroundcolor,
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(fontFamily: ('Poppins'), fontSize: 12),
        ),
        onTap: ontap);
  }
}
