import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moveit_flutter/app/controllers/theme_controller.dart';
import 'package:moveit_flutter/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            children: [
              ClipOval(
                child: SizedBox(
                  height: 100,
                  child: Image.network('https://github.com/wescleytorres.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Wescley Torres',
                        style: TextStyle(
                            color: ThemeController.instance.isDarkTheme
                                ? kBlue1
                                : kTitle,
                            fontFamily: 'Inter',
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/Up.svg'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Level 1',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Desafios completados',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                Text('00',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w500))
              ],
            ),
            Divider(
              thickness: 1,
              color: ThemeController.instance.isDarkTheme
                  ? Colors.white
                  : Color(0xffd7d8da),
            ),
          ],
        ),
      ]),
    );
  }
}
