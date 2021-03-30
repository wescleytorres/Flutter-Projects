import 'package:flutter/material.dart';
import 'package:moveit_flutter/app/components/ActivedChallenge.dart';
import 'package:moveit_flutter/app/components/ChallengeBox.dart';
import 'package:moveit_flutter/app/controllers/time_controller.dart';

class ChallengeContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: TimeController.instance,
      builder: (context, child) {
        return TimeController.instance.hasFinished
            ? ActivedChallenge()
            : ChallengeBox();
      },
    );
  }
}
