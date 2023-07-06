import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String name = 'Asnawi';
  void setUser({required String name}) async {
    this.name = name;
    notifyListeners();
  }
}
