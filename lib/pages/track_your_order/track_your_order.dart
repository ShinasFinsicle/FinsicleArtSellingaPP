import 'package:add/pages/track_your_order/widgets/order_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TrackYourOrder extends StatelessWidget {
  TrackYourOrder({super.key});
  final _user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Order"),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('art')
              .where('sold', isEqualTo: true)
              .where('buyerUid', isEqualTo: _user.uid)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data?.docs.isEmpty != true) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final artDetails = snapshot.data?.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OrderTile(
                        artName: artDetails['ArtName'],
                        orderDate: artDetails['uploadedat'],
                        price: artDetails['ArtPrice'],
                        artistEmail: artDetails['ArtistEmail'],
                      ),
                    );
                  },
                );
              }
            } else {
              return const Center(child: Text('No orders'));
            }
            return const Center(
              child: Text('No orders'),
            );
          },
        ));
  }
}
