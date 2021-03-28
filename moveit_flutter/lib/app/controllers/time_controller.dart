import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimeControler extends ChangeNotifier {
  static TimeControler instance = TimeControler();

  bool isActive = false;
  bool hasFinished = false;

  changeCounter() {
    if (!isActive) {
      isActive = true;
    }

    notifyListeners();
  }

  resetCountdown() {
    // time = 25 * 60;
    isActive = false;
    hasFinished = false;
    notifyListeners();
  }
}
