import 'package:add/constants/constant_colors.dart';
import 'package:add/provider/art/art_details_provider.dart';
import 'package:add/widgets/buttons/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shipment/shipment.dart';
import '../admin/admin_uid.dart';

class ArtDetail extends StatelessWidget {
  ArtDetail({
    super.key,
  });
  final _user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Consumer<ArtDetailsProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            value.artModels!.artName,
            style: const TextStyle(color: kPrimaryTextcolor),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    value.artModels!.artImages[0],
                  ),
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
                            value.artModels!.artDescription,
                            style: const TextStyle(
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
                _user.uid == adminUid
                    ? Container()
                    : Mybutton(
                        label: 'Buy Now',
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Shipment()));
                        })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
