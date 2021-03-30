import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moveit_flutter/app/controllers/time_controller.dart';
import 'package:moveit_flutter/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChallengeBox extends StatefulWidget {
  @override
  _ChallengeBoxState createState() => _ChallengeBoxState();
}

const hourGlass = SpinKitPouringHourglass(
  color: kGreen,
  size: 80,
);

class _ChallengeBoxState extends State<ChallengeBox> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: TimeController.instance,
      builder: (context, child) {
        bool isTimeActive = TimeController.instance.isActive;

        return AspectRatio(
          aspectRatio: 4 / 3,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  isTimeActive
                      ? 'Ao final do ciclo receba desafios a serem completados'
                      : 'Inicie um ciclo para receber desafios',
                  style: TextStyle(
                      color: kText,
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                isTimeActive
                    ? hourGlass
                    : SvgPicture.asset('assets/icons/Icon.svg'),
                isTimeActive
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Icon.svg',
                            height: 30,
                          ),
                          Container(
                            width: 10,
                          ),
                          Text(
                            'Complete-os e ganhe\nexperiência para avançar de level',
                            style: TextStyle(
                              color: kText,
                              fontFamily: 'Inter',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        'Avance de level completando os desafios.',
                        style: TextStyle(
                          color: kText,
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.right,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
