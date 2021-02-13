import 'package:flutter/material.dart';

class CircularAnimationProvider extends ChangeNotifier {
  bool startAnimation = false;

  setStartAnimation(bool value) {
    startAnimation = value;
    notifyListeners();
  }

  get getStartAnimation => startAnimation;
}
