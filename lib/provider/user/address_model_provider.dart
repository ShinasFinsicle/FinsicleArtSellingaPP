import 'package:flutter/material.dart';

class AddressModel {
  final String buildingname;
  final String city;
  final String name;
  final String state;
  final String uid;
  final String pincode;
  final String phonenumber;
  AddressModel(
      {required this.pincode,
      required this.phonenumber,
      required this.buildingname,
      required this.city,
      required this.name,
      required this.state,
      required this.uid});
}

class AddressDetailsProvider extends ChangeNotifier {
  bool loadingOnCheckOut = false;
  loadingOnCheckOutchanger() {
    loadingOnCheckOut = !loadingOnCheckOut;
    notifyListeners();
  }

  AddressModel? addressModel;
  setAddressModel(AddressModel value) {
    addressModel = AddressModel(
        buildingname: value.buildingname,
        city: value.city,
        name: value.name,
        state: value.state,
        uid: value.uid,
        phonenumber: value.phonenumber,
        pincode: value.pincode);
    notifyListeners();
  }
}
