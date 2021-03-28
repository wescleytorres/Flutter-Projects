import 'package:flutter/material.dart';
import 'package:moveit_flutter/constants.dart';

class BarExperience extends StatefulWidget {
  @override
  _BarExperienceState createState() => _BarExperienceState();
}

class _BarExperienceState extends State<BarExperience> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: LinearProgressIndicator(
          value: 0.20,
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
            "320 xp",
            style: TextStyle(fontFamily: 'Inter'),
          ),
          alignment: Alignment.bottomRight,
        ),
      ),
    ]);
  }
}
