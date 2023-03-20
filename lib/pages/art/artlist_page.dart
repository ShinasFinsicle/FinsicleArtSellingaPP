import 'package:add/constants/constant_colors.dart';
import 'package:add/pages/art/art_detail.dart';
import 'package:add/provider/art/art_details_provider.dart';

import 'package:add/widgets/art_tlie_widget.dart';
import 'package:add/widgets/drawer/drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArtlistScreen extends StatelessWidget {
  const ArtlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          "Welcome",
          style: TextStyle(
              color: kPrimaryTextcolor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: ('Poppins')),
        ),
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(4.0), // set the height of the bottom bar
          child: Container(
            width: double.infinity,
            height: 2.0,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white10, // set the color of the underline here
                  width: 0.5, // set the width of the underline here
                ),
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('art')
            .where('sold', isEqualTo: false)
            .orderBy('uploadedat', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data?.docs.isEmpty != true) {
              return GridView.builder(
                  itemCount: snapshot.data?.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemBuilder: (context, index) {
                    final artDetails = snapshot.data?.docs[index];
                    return GestureDetector(
                      onTap: () {
                        final ArtModel newModel = ArtModel(
                          artAdminUid: artDetails['ArtAdmin'],
                          artDescription: artDetails['ArtDescription'],
                          artImages: artDetails['ArtImages'],
                          artName: artDetails['ArtName'],
                          artPrice: artDetails['ArtPrice'],
                          shippingCost: artDetails['ShippingCost'],
                          artId: artDetails['ArtId'],
                        );
                        Provider.of<ArtDetailsProvider>(context, listen: false)
                            .setArtModel(newModel);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArtDetail()));
                      },
                      child: ArttileWidget(
                        artName: artDetails['ArtName'],
                        artPrice: artDetails['ArtPrice'],
                        artImages: artDetails['ArtImages'][0],
                      ),
                    );
                  });
            }
          } else {
            return const Center(child: Text('No art Available'));
          }
          return const Center(
            child: Text('No art Available'),
          );
        },
      ),
    );
  }
}
