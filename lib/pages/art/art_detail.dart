import 'package:add/constants/constant_colors.dart';
import 'package:add/widgets/buttons/my_button.dart';
import 'package:flutter/material.dart';

class ArtDetail extends StatelessWidget {
  const ArtDetail(
      {super.key,
      required this.artspecification,
      required this.artImage,
      required this.artName});
  final String artspecification;
  final String artImage;
  final String artName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          artName,
          style: TextStyle(color: kPrimaryTextcolor),
        ),
      ),
      body: ListView(
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(artImage),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                    child: Text(
                      "Specification:",
                      style: TextStyle(
                        color: Color(0xff223263),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                child: Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          artspecification,
                          style: TextStyle(
                            color: Color(0xff9098b1),
                            fontSize: 12,
                            letterSpacing: 0.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Mybutton(label: 'Buy Now', ontap: () {})
            ],
          ),
        ],
      ),
    );
  }
}
