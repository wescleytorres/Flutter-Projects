import 'package:flutter/foundation.dart';

class TimeController extends ChangeNotifier {
  static TimeController instance = TimeController();

  bool isActive = false;
  bool hasFinished = false;

  changeCounter() {
    isActive = !isActive;
    notifyListeners();
  }

  finishCounter() {
    hasFinished = !hasFinished;
    notifyListeners();
  }
}
