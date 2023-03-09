import 'package:flutter/material.dart';

class CoustomElevatedButoon extends StatelessWidget {
  const CoustomElevatedButoon(
      {super.key,
      required this.label,
      required this.ontap,
      required this.backGroundColor});
  final String label;
  final Function() ontap;
  final Color backGroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backGroundColor),
      onPressed: ontap,
      child: Text(
        label,
      ),
    );
  }
}
