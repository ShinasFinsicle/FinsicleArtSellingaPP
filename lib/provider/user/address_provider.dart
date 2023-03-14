import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  final _user = FirebaseAuth.instance.currentUser!;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();
  bool uploading = false;
  uploadchanger() {
    uploading = !uploading;
    notifyListeners();
  }

  clear() {
    nameController.clear();
    phoneNumberController.clear();
    pincodeController.clear();
    stateController.clear();
    cityController.clear();
    buildingNameController.clear();
    notifyListeners();
  }

  Future<void> uploadUserdetailstoFirebase() async {
    try {
      FirebaseFirestore.instance.collection('user').doc(_user.uid).set(({
            'name': nameController.text,
            'phonenmuber': phoneNumberController.text,
            'pincode': pincodeController.text,
            'state': stateController.text,
            'city': cityController.text,
            'buildingname': buildingNameController.text,
            'uid': _user.uid
          }));
    } catch (e) {
      print(e);
    }
  }
}
