import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void nextPage(int totalPages) {
    if (_currentIndex < totalPages - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  void jumpToPage(int page) {
    _currentIndex = page - 1;
    notifyListeners();
  }
}
