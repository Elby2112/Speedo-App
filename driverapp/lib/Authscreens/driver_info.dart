import 'package:flutter/material.dart';

class DriverInfo extends ChangeNotifier {
  String firstName = '';
  String lastName = '';
  String email = '';
  bool cargoSelected = false;
  bool towSelected = false;

  void updateFirstName(String value) {
    firstName = value;
    notifyListeners();
  }

  void updateLastName(String value) {
    lastName = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void selectCargo() {
    cargoSelected = true;
    towSelected = false;
    notifyListeners();
  }

  void selectTow() {
    cargoSelected = false;
    towSelected = true;
    notifyListeners();
  }
}
