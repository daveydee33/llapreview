import 'package:flutter/material.dart';
import 'package:llapreview/services/models.dart';

class QuizState with ChangeNotifier {
  double _progress = 0;
  Option? _selected;

  double get progress => _progress;
  Option? get selected => _selected;

  set progress(double newValue) {
    _progress = newValue;
    notifyListeners();
  }

  set selected(Option? newValue) {
    _selected = newValue;
    notifyListeners();
  }
}
