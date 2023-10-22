import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//styles
import 'package:mobile_banking_app/screens/payment_done.dart';

//widgets
import 'package:mobile_banking_app/widgets/user_profile_pic.dart';

//styles
import 'package:mobile_banking_app/styles/theme_color.dart';

paymentBottomSheet(context, profile, name, number, buttonValue){
  final TextEditingController paymentFieldTEController = TextEditingController();

  return showModalBottomSheet(context: context,
      shape: const RoundedRectangleBorder(
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (context){
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UserProfilePic(profilePic: profile),
              Text(name, style: Theme.of(context).textTheme.bodyLarge),
              Text(number, style: Theme.of(context).textTheme.bodySmall),
              Center(
                child: SizedBox(
                  width: 45.w,
                  child: TextField(
                    controller: paymentFieldTEController,
                    style: Theme.of(context).textTheme.headlineLarge,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money, size: 38.sp, color: Colors.grey),
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        fontSize: 36.sp,
                        fontFamily: 'hind',
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                      ),
                      border: const OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
                height: 54.sp,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PaymentDoneScreen(amount: paymentFieldTEController.text, userPic: profile)),
                              (route) => false);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: ThemeColor.primaryColor),
                    child: Text(buttonValue)),
              )
            ],
          ),
        );
      });
}