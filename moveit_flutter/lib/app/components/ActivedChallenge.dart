import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moveit_flutter/app/controllers/time_controller.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:moveit_flutter/app/controllers/xp_controller.dart';
import 'package:moveit_flutter/constants.dart';

class ActivedChallenge extends StatefulWidget {
  @override
  _ActivedChallengeState createState() => _ActivedChallengeState();
}

class _ActivedChallengeState extends State<ActivedChallenge> {
  List data;
  var newRandom = Random().nextInt(12);
  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/data.json');
    setState(
      () {
        data = json.decode(jsonText);
      },
    );
    return 'success';
  }

  @override
  void initState() {
    super.initState();

    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: FutureBuilder(
        future: loadJsonData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _actionChallenge(context, snapshot);
          } else {
            return Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(kBlue1),
                strokeWidth: 5,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _actionChallenge(BuildContext context, AsyncSnapshot snapshot) {
    int amoutXp = data[newRandom]['amount'];
    String descriptionChallenge = data[newRandom]['description'];
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          Text(
            'Ganhe $amoutXp xp',
            style: TextStyle(
              color: kBlue1,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(
            thickness: 1,
            color: Color(0xffd7d8da),
            indent: 30,
            endIndent: 30,
          ),
          SvgPicture.asset(
            data[newRandom]['type'] == 'body'
                ? 'assets/images/body.svg'
                : 'assets/images/Eye.svg',
            height: 100,
          ),
          Text(
            'Exercite-se',
            style: TextStyle(
                color: kTitle, fontSize: 30, fontWeight: FontWeight.w600),
          ),
          Text(
            '$descriptionChallenge',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  TimeController.instance.finishCounter();
                },
                child: Text('Falhei'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kRed)),
              )),
              SizedBox(
                width: 3,
              ),
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  TimeController.instance.finishCounter();
                  XpController.instance.countXp(amoutXp);
                  print(XpController.instance.xpAmount);
                },
                child: Text('Completei'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kGreen)),
              )),
            ],
          )
        ],
      ),
    );
  }
}
