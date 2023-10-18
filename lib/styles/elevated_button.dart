import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonStyle(){
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}