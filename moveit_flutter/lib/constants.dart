import 'package:flutter/material.dart';

const kBackground = Color(0xFFF2F3F5);
const kBackgroundDark = Color(0xFF222222);
const kBlue1 = Color(0xFF5965E0);
const kBlue2 = Color(0xFF4953B8);
const kGreen = Color(0xFF4CD62B);
const kRed = Color(0xFFE83F5B);
const kTextBlue = Color(0xFFB2B9FF);
const kTitle = Color(0xFF2E384D);
const kText = Color(0xFF666666);
const kGrayLine = Color(0xFFDCDDE0);

Widget colorGradient() {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[kBlue1, kBlue2])),
  );
}
