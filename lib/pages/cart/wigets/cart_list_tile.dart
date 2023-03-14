import 'package:flutter/material.dart';

import '../../../constants/constant_colors.dart';

class CartListTile extends StatelessWidget {
  const CartListTile(
      {super.key,
      required this.imgUrlCrt,
      required this.artNameCrt,
      required this.artPriceCrt});
  final String imgUrlCrt;
  final String artNameCrt;
  final String artPriceCrt;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 104,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 343,
            height: 104,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color(0xffeaefff),
                width: 1,
              ),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 100,
                  top: 16,
                  child: SizedBox(
                    width: 158,
                    child: Text(
                      artNameCrt,
                      style: const TextStyle(
                        color: Color(0xff223263),
                        fontSize: 12,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 70,
                  child: Text(
                    '₹ $artPriceCrt',
                    style: const TextStyle(
                      color: Color(0xff40bfff),
                      fontSize: 12,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.50,
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.network(imgUrlCrt)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
