import 'package:add/constants/text.dart/colors.dart';
import 'package:flutter/material.dart';

class ArtlistScreen extends StatelessWidget {
  const ArtlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome Shinas",
          style: TextStyle(
              color: kPrimaryTextcolor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: ('Poppins')),
        ),
      ),
    );
  }
}
