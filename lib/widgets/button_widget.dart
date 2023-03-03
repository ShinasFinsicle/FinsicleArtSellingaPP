import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({super.key, required this.label, required this.ontap});

  final String label;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xff40bfff),
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontFamily: ('Poppins reg')),
        ),
      ),
    );
  }
}
