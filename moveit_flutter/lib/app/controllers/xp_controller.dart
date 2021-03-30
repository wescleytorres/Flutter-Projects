import 'package:flutter/foundation.dart';

class XpController extends ChangeNotifier {
  static XpController instance = XpController();

  num xpAmount = 50;
  num level = 1;

  countXp(int xpAmount) {
    this.xpAmount += xpAmount;
    notifyListeners();
  }

  levelUp() {
    this.level++;
  }
}
