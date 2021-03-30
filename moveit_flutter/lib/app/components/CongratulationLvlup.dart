import 'package:flutter/material.dart';
import 'package:moveit_flutter/app/controllers/xp_controller.dart';
import 'package:moveit_flutter/constants.dart';

class CongratulationLevelUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.all(5),
        content: AspectRatio(
          aspectRatio: 0.7,
          child: Container(
              child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close_rounded),
                  onPressed: () {
                    XpController.instance.congratulationsLevelUp();
                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.zero,
                  alignment: Alignment.topRight,
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage('assets/images/Union.png')),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          _myStyleText('${XpController.level}', 160, kBlue1,
                              FontWeight.w600),
                          _myStyleText('Parabéns', 30, kTitle, FontWeight.w600),
                          _myStyleText('Você alcançou um novo level.', 20,
                              kTitle, FontWeight.normal),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Expanded(
                  child: Container(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _myStyleText('DESAFIOS', 15, kText.withOpacity(0.5),
                            FontWeight.w600),
                        Row(
                          children: [
                            _myStyleText(
                                '${XpController.instance.challengeComplete} ',
                                25,
                                kBlue1,
                                FontWeight.w500),
                            _myStyleText(
                                'completados', 25, kText, FontWeight.w500),
                          ],
                        ),
                        Divider(),
                        _myStyleText('EXPERIÊNCIA', 15, kText.withOpacity(0.5),
                            FontWeight.w600),
                        Row(
                          children: [
                            _myStyleText('${XpController.instance.experience} ',
                                25, kBlue1, FontWeight.w500),
                            _myStyleText('xp', 25, kText, FontWeight.w500),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/icons/Logo.png',
                      ),
                    )
                  ],
                ),
              ))
            ],
          )),
        ));
  }

  Widget _myStyleText(String myText, double myFontSize, Color myColor,
      FontWeight myFontWeight) {
    return Text(myText,
        style: TextStyle(
            fontFamily: 'Inter',
            fontSize: myFontSize,
            color: myColor,
            fontWeight: myFontWeight));
  }
}
