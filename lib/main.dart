import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//screens
import 'package:mobile_banking_app/screens/welcome.dart';

//styles
import 'package:mobile_banking_app/styles/text.dart';
import 'package:mobile_banking_app/styles/elevated_button.dart';
import 'package:mobile_banking_app/styles/appbar.dart';
import 'package:mobile_banking_app/styles/bottom_appbar.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const WelcomeScreen(),
          title: 'Mobile Banking App',
          theme: ThemeData(
            textTheme: headlineTextStyle(),
            elevatedButtonTheme: elevatedButtonStyle(),
            appBarTheme: appBarStyle(),
            bottomAppBarTheme: bottomAppBarStyle(),
          ),
        );
      }
    );
  }

}