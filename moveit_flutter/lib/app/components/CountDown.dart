import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moveit_flutter/app/controllers/theme_controller.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';

class CountDown extends StatefulWidget {
  @override
  _CountDownState createState() => _CountDownState();
}

NumberFormat formatter = NumberFormat("00");

class _CountDownState extends State<CountDown> {
  static double time = 0.1 * 60;
  int timeMinutes = (time / 60).floor();
  int timeSeconds = time.toInt() % 60;
  Timer timer;

  void _startCount() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (time > 0) {
          time--;
          timeMinutes = (time / 60).floor();
          timeSeconds = time.toInt() % 60;

          //aqui so pra teste
          print(timeSeconds);
          if (timeSeconds == 56) {
            timer.cancel();
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
              label: Text('Iniciar um ciclo'),
              icon: Icon(Icons.play_arrow_rounded),
              onPressed: _startCount,
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
