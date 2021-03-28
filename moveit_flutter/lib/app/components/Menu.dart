import 'package:flutter/material.dart';
import 'package:moveit_flutter/app/controllers/menu_controller.dart';
import 'package:moveit_flutter/constants.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool checkHome = true;
  bool checkRank = false;

  String iconHome = 'assets/icons/House.png';
  String iconHomeCheck = 'assets/icons/House-check.png';

  String iconRank = 'assets/icons/Reanking.png';
  String iconRankCheck = 'assets/icons/Reanking-check.png';

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: MenuController.instance.isVisible,
      child: RotatedBox(
        quarterTurns: 3,
        child: SizedBox(
          width: 80,
          child: RotatedBox(
            quarterTurns: 1,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [kBlue1, Colors.white])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(checkHome ? iconHomeCheck : iconHome),
                        onPressed: () {
                          setState(() {
                            if (!checkHome) {
                              checkHome = !checkHome;
                              checkRank = false;
                              MenuController.instance.changeMenu();
                            }
                          });
                        },
                        iconSize: 70,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(right: 9),
                      ),
                      IconButton(
                        icon: Image.asset(
                          checkRank ? iconRankCheck : iconRank,
                        ),
                        onPressed: () {
                          setState(() {
                            if (!checkRank) {
                              checkRank = !checkRank;
                              checkHome = false;
                              MenuController.instance.changeMenu();
                            }
                          });
                        },
                        iconSize: 70,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(right: 9),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colors.black.withOpacity(0.2),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        MenuController.instance.changeMenu();
                      });
                    },
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
