import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

TextTheme headlineTextStyle(){
  return TextTheme(
    headlineLarge: TextStyle(
      fontSize: 36.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 14.sp,
      fontWeight: FontWeight.w100,
    ),
  );
}