import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  User? user;
  // Map<String, dynamic>? _userData;
  String name = '';
  String buildingname = '';
  String city = '';
  String phonenmuber = '';
  String pincode = '';
  String state = '';
  Future<void> getUserData() async {
    try {
      final DocumentSnapshot snapshot =
          await firestore.collection('user').doc(user!.uid).get();
      if (snapshot == null) {
        return;
      } else {
        name = snapshot.get('name');
        buildingname = snapshot.get('buildingname');
        city = snapshot.get('city');
        phonenmuber = snapshot.get('phonenmuber');

        pincode = snapshot.get('pincode');

        state = snapshot.get('state');
        notifyListeners();
      }
    } catch (e) {}
    notifyListeners();
  }

  pri() {
    print("oj");
  }
}
