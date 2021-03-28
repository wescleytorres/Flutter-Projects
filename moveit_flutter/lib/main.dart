import 'package:flutter/material.dart';
import 'package:moveit_flutter/app/controllers/theme_controller.dart';
import 'package:moveit_flutter/constants.dart';
import 'app/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: ThemeController.instance,
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Moveit Flutter',
              theme: ThemeData(
                  scaffoldBackgroundColor: ThemeController.instance.isDarkTheme
                      ? kBackgroundDark
                      : kBackground,
                  textTheme: Theme.of(context).textTheme.apply(
                        bodyColor: ThemeController.instance.isDarkTheme
                            ? Colors.white
                            : kText,
                      )),
              home: HomePage(),
            ));
  }
}
