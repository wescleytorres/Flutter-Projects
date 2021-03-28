import 'package:flutter/foundation.dart';

class MenuController extends ChangeNotifier {
  static MenuController instance = MenuController();

  bool isVisible = false;

  changeMenu() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
