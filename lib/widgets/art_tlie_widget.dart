import 'package:add/pages/art/art_detail.dart';
import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';

class ArttileWidget extends StatelessWidget {
  const ArttileWidget(
      {super.key,
      required this.artName,
      required this.artPrice,
      required this.artImages});
  final String artName;
  final String artPrice;
  final String artImages;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        child: Card(
          child: SizedBox(
            child: Column(
              children: [
                Expanded(
                  child: Card(
                    child: Image.network(
                      artImages,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    artName,
                    style: const TextStyle(
                      color: kPrimaryTextcolor,
                      fontSize: 15,
                      fontFamily: ('Poppins'),
                      letterSpacing: 0.50,
                    ),
                  ),
                ),
                Text(
                  ' ₹ $artPrice',
                  style: const TextStyle(
                    color: Color(0xff40bfff),
                    fontSize: 15,
                    fontFamily: ('Poppins'),
                    letterSpacing: 0.50,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
