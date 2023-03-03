import 'package:add/artlistingpages/artdetail.dart';
import 'package:add/constants/text.dart/colors.dart';
import 'package:flutter/material.dart';

class ArttileWidget extends StatelessWidget {
  const ArttileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ArtDetail();
        }));
      },
      child: Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                child: Image.asset("assets/images/art 1.jpg")),
          ),
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Text(
              'Awesome Paint',
              style: TextStyle(
                  color: kPrimaryTextcolor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: ('Poppins')),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Text(
              "2993",
              style: TextStyle(
                  color: Color(0xff40bfff),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: ('Poppins')),
            ),
          ),
        ]),
      ),
    );
  }
}
