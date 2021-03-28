import 'package:flutter/material.dart';
import 'package:moveit_flutter/app/controllers/menu_controller.dart';
import 'package:moveit_flutter/app/controllers/theme_controller.dart';
import 'package:moveit_flutter/constants.dart';

import '../components/Profile.dart';
import '../components/BarExperience.dart';
import '../components/ChallengeBox.dart';
import '../components/CountDown.dart';
import '../components/Menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset('assets/icons/Logo-theme.png'),
            onPressed: () {
              setState(() {
                MenuController.instance.changeMenu();
              });
            }),
        title: Image.asset('assets/images/Title.png', height: 30),
        centerTitle: true,
        flexibleSpace: colorGradient(),
        actions: [
          IconButton(
            icon: Icon(ThemeController.instance.isDarkTheme
                ? Icons.nights_stay
                : Icons.nights_stay_outlined),
            onPressed: () {
              ThemeController.instance.changeTheme();
            },
            iconSize: 30,
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: [
                BarExperience(),
                Profile(),
                ChallengeBox(),
                CountDown(),
              ],
            ),
          ),
          Container(height: MediaQuery.of(context).size.height, child: Menu()),
        ],
      ),
    );
  }
}
