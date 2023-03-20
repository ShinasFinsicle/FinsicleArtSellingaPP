import 'package:flutter/material.dart';

class StatusUpdateProvider extends ChangeNotifier {
  String? selectedStatus;

  onChanger(value) {
    selectedStatus = value;
    notifyListeners();
  }
}
