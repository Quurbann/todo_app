import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  List<String> _tasks = [];

  List<String> get tasks => _tasks;

  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    _tasks = prefs.getStringList('tasks') ?? [];
    notifyListeners();
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
