import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moveit_flutter/app/controllers/theme_controller.dart';
import 'package:intl/intl.dart';
import 'package:moveit_flutter/app/controllers/time_controller.dart';
import '../../constants.dart';

class CountDown extends StatefulWidget {
  @override
  _CountDownState createState() => _CountDownState();
}

NumberFormat formatter = NumberFormat("00");

class _CountDownState extends State<CountDown> {
  static int time = 25 * 60;
  int timeMinutes = (time / 60).floor();
  int timeSeconds = time % 60;
  Timer timer;

  void _startCount() {
    TimeController.instance.changeCounter();
    time--;
    setState(() {
      timeMinutes = (time / 60).floor();
      timeSeconds = time % 60;
    });

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        time--;
        setState(() {
          timeMinutes = (time / 60).floor();
          timeSeconds = time.toInt() % 60;
        });
      } else {
        _resetCount();
        TimeController.instance.finishCounter();
      }
    });
  }

  void _resetCount() {
    TimeController.instance.changeCounter();
    timer.cancel();
    time = 25 * 60;
    setState(() {
      timeMinutes = (time / 60).floor();
      timeSeconds = time.toInt() % 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isCountdownActive = TimeController.instance.isActive;
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _mycount('${formatter.format(timeMinutes)[0]}', 1),
                SizedBox(
                  width: 1.5,
                ),
                _mycount('${formatter.format(timeMinutes)[1]}', 2),
                Text(
                  ':',
                  style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontSize: 120,
                      color: ThemeController.instance.isDarkTheme
                          ? Colors.white
                          : kBackgroundDark,
                      fontWeight: FontWeight.w600),
                ),
                _mycount('${formatter.format(timeSeconds)[0]}', 1),
                SizedBox(width: 1.5),
                _mycount('${formatter.format(timeSeconds)[1]}', 2),
              ],
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      isCountdownActive ? Colors.white : kBlue1),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      isCountdownActive ? kText : null)),
              label: Text(
                isCountdownActive ? 'Abandonar ciclo' : 'Iniciar um ciclo',
              ),
              icon: Icon(isCountdownActive
                  ? Icons.close_rounded
                  : Icons.play_arrow_rounded),
              onPressed: isCountdownActive ? _resetCount : _startCount,
            ),
          ],
        ),
      ),
    );
  }

  Widget _mycount(String myText, radiuBoxPosition) {
    var _radiu = radiuBoxPosition;
    return Container(
      width: 80,
      decoration: BoxDecoration(
          color: ThemeController.instance.isDarkTheme
              ? Colors.white
              : kBackgroundDark,
          borderRadius: _radiu == 1
              ? BorderRadius.only(
                  topLeft: Radius.circular(4), bottomLeft: Radius.circular(4))
              : BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4))),
      child: Text(
        myText,
        style: TextStyle(
            fontFamily: 'Rajdhani',
            fontSize: 120,
            color: ThemeController.instance.isDarkTheme ? kTitle : Colors.white,
            fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }
}
