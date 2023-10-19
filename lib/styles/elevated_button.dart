import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

ElevatedButtonThemeData elevatedButtonStyle(){
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      textStyle: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'Hind'
      ),
    ),
  );
}