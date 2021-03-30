import 'dart:math';

import 'package:flutter/foundation.dart';

class XpController extends ChangeNotifier {
  static XpController instance = XpController();
  static num level = 1;
  num xpAmount = 0;
  num experience = 0;
  num xpToNextLvl = pow((level + 1) * 4, 2);
  double xpConvertedToBar = 0.0;
  num challengeComplete = 0;

  bool isLevelUp = false;

  countXp(int amoutXp) {
    this.xpAmount += amoutXp;
    challengeComplete++;
    experience += amoutXp;

    if (this.xpAmount >= xpToNextLvl) {
      levelUp();
    } else {
      xpConvertedToBar = ((xpAmount * 100) / xpToNextLvl) / 100;
    }
    notifyListeners();
  }

  levelUp() {
    xpAmount = xpAmount - xpToNextLvl;
    level++;
    xpToNextLvl = pow((level + 1) * 4, 2);
    xpConvertedToBar = ((xpAmount * 100) / xpToNextLvl) / 100;
    congratulationsLevelUp();

    notifyListeners();
  }

  congratulationsLevelUp() {
    isLevelUp = !isLevelUp;
    notifyListeners();
  }
}
