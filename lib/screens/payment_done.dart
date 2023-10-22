import 'package:flutter/material.dart';
import 'package:mobile_banking_app/screens/home.dart';
import 'package:sizer/sizer.dart';

//widgets
import 'package:mobile_banking_app/widgets/user_profile_pic.dart';

//styles
import 'package:mobile_banking_app/styles/theme_color.dart';

class PaymentDoneScreen extends StatelessWidget{
  late String amount;
  late String userPic;

  PaymentDoneScreen({super.key, required this.amount, required this.userPic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserProfilePic(profilePic: userPic),
            Text('Congratulation!', style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 0.5.h),
            Text('Successfully Done', style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 2.h),
            SizedBox(
              width: 70.sp,
              height: 30.sp,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text('\$$amount', style: TextStyle(
                      fontFamily: 'Hind',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)
                  ),
                ),
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
              onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreenState(moneySpend: amount)),
                        (route) => false);
              },
              child: const Text("Done"),
            ),
          ),
        ),
      ),
    );
  }

}