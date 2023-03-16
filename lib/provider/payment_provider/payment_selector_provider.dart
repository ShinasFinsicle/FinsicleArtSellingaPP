import 'package:flutter/material.dart';

class PaymentSelectionProvider extends ChangeNotifier {
  String? selectedPaymentMedthod;

  onPaymentChanger(value) {
    selectedPaymentMedthod = value;
    notifyListeners();
  }
}
