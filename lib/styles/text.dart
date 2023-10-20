import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

TextTheme headlineTextStyle(){
  const FontWeight fontBold = FontWeight.bold;
  const Color fontColor = Colors.black;
  const String primaryFont = 'Montserrat';

  return TextTheme(
    headlineLarge: TextStyle(
      fontSize: 29.sp,
      fontWeight: fontBold,
      color: fontColor,
      fontFamily: primaryFont,
    ),
    bodyLarge: TextStyle(
      fontSize: 15.sp,
      fontWeight: fontBold,
      color: fontColor,
      fontFamily: primaryFont,

    ),
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 14.sp,
      fontWeight: FontWeight.w100,
      fontFamily: 'Hind',
    ),
  );
}