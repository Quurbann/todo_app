import 'package:flutter/material.dart';

class AddTaskProvider extends ChangeNotifier {
  String title = '';
  String description = '';
  String categoryName = '';
  String selectedPriority = '';
  Color categoryBGColor = Colors.transparent;

  void setTitle(String value) {
    title = value;
    notifyListeners();
  }

  void setDescription(String value) {
    description = value;
    notifyListeners();
  }

  void setCategory(String value, Color color) {
    categoryName = value;
    categoryBGColor = color;
    notifyListeners();
  }

  void setPriority(String value) {
    selectedPriority = value;
    notifyListeners();
  }

  void clear() {
    title = '';
    description = '';
    categoryName = '';
    selectedPriority = '';
    categoryBGColor = Colors.grey;
    notifyListeners();
  }
}
