import "package:flutter/material.dart";
import 'package:sizer/sizer.dart';

//widgets
import 'package:mobile_banking_app/widgets/bottom_appbar.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 1.h),
          Expanded(
            child: AspectRatio(
              aspectRatio: 4/3,
              child: Image.asset("assets/welcome/fiat_money.png"),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }

}