import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddressProvider extends ChangeNotifier {
  final _user = FirebaseAuth.instance.currentUser!;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController stateController =
      TextEditingController(text: "State");
  final TextEditingController countryController =
      TextEditingController(text: "Country");
  final TextEditingController cityController =
      TextEditingController(text: "City");
  final TextEditingController buildingNameController = TextEditingController();
  bool uploading = false;
  bool colorChange = false;
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

  onTapColorchange() {
    colorChange = !colorChange;
    notifyListeners();
  }

  Future<void> uploadUserdetailstoFirebase() async {
    try {
      final addressId = const Uuid().v4();
      FirebaseFirestore.instance.collection('user').doc(addressId).set(({
            'name': nameController.text,
            'phonenmuber': phoneNumberController.text,
            'pincode': pincodeController.text,
            'state': stateController.text,
            'city': cityController.text,
            'buildingname': buildingNameController.text,
            'uid': _user.uid,
            'addressUid': addressId
          }));
    } catch (e) {
      print(e);
    }
  }
}
