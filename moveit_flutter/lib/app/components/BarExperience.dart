// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:moveit_flutter/app/controllers/xp_controller.dart';
import 'package:moveit_flutter/constants.dart';

class BarExperience extends StatefulWidget {
  @override
  _BarExperienceState createState() => _BarExperienceState();
}

NumberFormat formatter = NumberFormat("0.00");

class _BarExperienceState extends State<BarExperience> {
  // static final level = XpController.instance.level;

  // colocar no controller
  // var experienceToNextLevel = pow((level + 1) * 4, 2);

  // void _updateStatus() {
  //   if (experienceToNextLevel - XpController.instance.xpAmount < 0) {
  //     XpController.instance.levelUp();
  //     var differenceXp = XpController.instance.xpAmount - experienceToNextLevel;
  //   }
  // }
  // double valueBarXp =
  //     ((XpController.instance.xpAmount * 100) / experienceToNextLevel) / 100;
  // print(valueBarXp);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: LinearProgressIndicator(
          value: 0.7,
          backgroundColor: kGrayLine,
          valueColor: AlwaysStoppedAnimation<Color>(kGreen),
          minHeight: 8,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Align(
          child: Text(
            "0 xp",
            style: TextStyle(fontFamily: 'Inter'),
          ),
          alignment: Alignment.bottomLeft,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Align(
          child: Text(
            "64 xp",
            style: TextStyle(fontFamily: 'Inter'),
          ),
          alignment: Alignment.bottomRight,
        ),
      ),
    ]);
  }
}
