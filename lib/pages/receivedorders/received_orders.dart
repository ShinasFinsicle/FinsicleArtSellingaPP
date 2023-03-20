import 'package:add/pages/receivedorders/widget/received_order_tile.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReceivedOrders extends StatelessWidget {
  ReceivedOrders({super.key});
  final _user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Received Orders "),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('art')
            .where('sold', isEqualTo: true)
            .where('ArtAdmin', isEqualTo: _user.uid)
            .orderBy('uploadedat', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data?.docs.isEmpty != true) {
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    final artDetails = snapshot.data?.docs[index];
                    return ReceivedOrderTile(
                      artName: artDetails['ArtName'],
                      orderDate: artDetails['uploadedat'],
                      buyerAddressUid: artDetails['buyeraddressUid'],
                      artId: artDetails['ArtId'],
                      orderstatus: artDetails['Shipment'],
                    );
                  });
            }
          } else {
            return const Center(child: Text('No orders'));
          }
          return const Center(
            child: Text('No orders'),
          );
        },
      ),
    );
  }
}
