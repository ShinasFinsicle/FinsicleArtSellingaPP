import 'package:add/widgets/buttons/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ArtDetail extends StatelessWidget {
  const ArtDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset("assets/images/art 1.jpg"),
          Mybutton(label: 'Buy Now', ontap: () {})
          // Button2()
        ],
      ),
    );
  }
}
