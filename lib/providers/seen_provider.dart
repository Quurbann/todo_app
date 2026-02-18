import 'package:flutter/material.dart';

class SeenProvider extends ChangeNotifier{
  bool hasSeenLogin = false;
  bool hasSeenOnboarding = false;

  void setHasSeenLogin(bool value) {
    hasSeenLogin = value;
    notifyListeners();
  }

  void setHasSeenOnboarding(bool value) {
    hasSeenOnboarding = value;
    notifyListeners();
  }
}