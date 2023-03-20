import 'package:add/constants/constant_colors.dart';
import 'package:add/pages/user/address/adress.dart';
import 'package:add/provider/user/address_model_provider.dart';
import 'package:add/shipment/widgets/address_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/cart/cart.dart';

class Shipment extends StatelessWidget {
  Shipment({super.key});
  final _user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Shipment address"),
          actions: [
            IconButton(
              color: kBackgroundcolor,
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Address()));
              },
            ),
          ],
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('user')
                .where('uid', isEqualTo: _user.uid)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data?.docs.isEmpty != true) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              final address = snapshot.data?.docs[index];
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: InkWell(
                                  onTap: () {
                                    final AddressModel newModel = AddressModel(
                                        buildingname: address['buildingname'],
                                        city: address['city'],
                                        name: address['name'],
                                        state: address['state'],
                                        uid: address['uid'],
                                        phonenumber: address['phonenmuber'],
                                        pincode: address['pincode'],
                                        addressId: address['addressUid']);
                                    Provider.of<AddressDetailsProvider>(context,
                                            listen: false)
                                        .setAddressModel(newModel);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Cart()));
                                  },
                                  child: AddressTile(
                                      name: address['name'],
                                      buildingname: address['buildingname'],
                                      city: address['city'],
                                      phonenmuber: address['phonenmuber'],
                                      pincode: address['pincode'],
                                      state: address['state']),
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: Text(" Please Add Your Address"));
                }
              }
              return const Center(
                child: Text('Something Went Wrong'),
              );
            }));
  }
}
