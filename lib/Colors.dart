import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Color(0xffe2e2ff);
  static Color mainColor = Color(0xff000633);
  static Color accentColor = Color(0xff0065FF);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
    Colors.grey.shade100,
    Colors.amber.shade100,
    Colors.purple.shade100,
  ];

  static TextStyle maintitle =
      GoogleFonts.roboto(fontSize: 18.sp, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 16.sp, fontWeight: FontWeight.normal);

  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 13.sp, fontWeight: FontWeight.w500);
}
