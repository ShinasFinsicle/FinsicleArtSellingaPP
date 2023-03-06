import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({super.key, required this.label, required this.ontap});

  final String label;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Color(0x3d40bfff),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
            color: Color(0xff40bfff),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 311,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
