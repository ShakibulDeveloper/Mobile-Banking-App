import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//screens
import 'package:mobile_banking_app/screens/verify.dart';

//style
import 'package:mobile_banking_app/styles/input.dart';
import 'package:mobile_banking_app/styles/theme_color.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Welcome Back!", style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 2.h),
            Text('Sign in to your account.', style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 3.h),
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: inputDecorationStyle("Phone Number"),
            ),
            SizedBox(height: 2.h),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: inputDecorationStyle("Enter Pin Number"),
            ),
            TextButton(onPressed: (){}, child: const Text("Forgot pin?", style: TextStyle(color: ThemeColor.primaryColor, fontFamily: 'Hind', fontWeight: FontWeight.w500))),
            SizedBox(height: 2.h),
            SizedBox(
              width: 100.w,
              height: 54.sp,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: ThemeColor.primaryColor),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyScreen()));
                  },
                  child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }

}