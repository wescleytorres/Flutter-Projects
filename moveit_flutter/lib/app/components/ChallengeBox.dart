import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moveit_flutter/constants.dart';

class ChallengeBox extends StatefulWidget {
  @override
  _ChallengeBoxState createState() => _ChallengeBoxState();
}

class _ChallengeBoxState extends State<ChallengeBox> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Inicie um ciclo para receber desafios',
              style: TextStyle(
                  color: kText,
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SvgPicture.asset('assets/icons/Icon.svg'),
            Text(
              'Avance de level completando os desafios.',
              style: TextStyle(
                color: kText,
                fontFamily: 'Inter',
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
