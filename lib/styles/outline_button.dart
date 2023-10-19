import 'package:flutter/material.dart';

//styles
import 'package:mobile_banking_app/styles/theme_color.dart';

OutlinedButtonThemeData outlineButtonStyle(){
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: ThemeColor.primaryColor,
    ),
  );
}