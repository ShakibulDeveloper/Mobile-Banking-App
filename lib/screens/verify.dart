import 'package:flutter/material.dart';
import 'package:mobile_banking_app/styles/theme_color.dart';
import 'package:sizer/sizer.dart';

//widget
import 'package:mobile_banking_app/widgets/verify_input.dart';

class VerifyScreen extends StatelessWidget{
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Verify", style: Theme.of(context).textTheme.headlineLarge),
            Text("Check your phone for verification code.", style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 3.h),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const VerifyInput(),
                  SizedBox(width: 2.w),
                  const VerifyInput(),
                  SizedBox(width: 2.w),
                  const VerifyInput(),
                  SizedBox(width: 2.w),
                  const VerifyInput(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0,
          ),
          child: SizedBox(
            width: 100.w,
            height: 52.sp,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: ThemeColor.primaryColor),
              onPressed: (){},
              child: const Text("Continue"),
            ),
          ),
        ),
      ),
    );
  }

}