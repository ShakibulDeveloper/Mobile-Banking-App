import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//models
import 'package:mobile_banking_app/models/payment_options.dart';
import 'package:mobile_banking_app/models/users.dart';

//screens
import 'package:mobile_banking_app/screens/users.dart';

class PaymentOption extends StatefulWidget{
  List<Users> userList;
  PaymentOption({super.key, required this.userList});

  @override
  State<StatefulWidget> createState() => PaymentOptionUI();

}

class PaymentOptionUI extends State<PaymentOption>{
  late String pageTitle;

  List<PaymentOptions> paymentOptions = [
    PaymentOptions(icon: 'assets/send-money.png', name: 'Send Money'),
    PaymentOptions(icon: 'assets/payment.png', name: 'Receive Money'),
    PaymentOptions(icon: 'assets/phone-banking.png', name: 'Mobile Recharge'),
    PaymentOptions(icon: 'assets/pay-bill.png', name: 'Pay Bills'),
  ];

  //===SET_SCREEN_TITLE====
  void setScreenTitle(int index){
    if(index == 0){
      pageTitle  = "Send money";
    }else if(index == 1){
      pageTitle = "Receive Money";
    }else if(index == 2){
      pageTitle = "Recharge";
    }else{
      pageTitle = "Pay Bills";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: paymentOptions.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.sp,
        crossAxisSpacing: 10.sp,
      ),
      itemBuilder: (context, index){
        return InkWell(
          onTap: (){
            setScreenTitle(index);
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen(title: pageTitle, userList: widget.userList)));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 50.w,
            height: 50.w,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(paymentOptions[index].icon, height: 32.sp),
                  SizedBox(height: 2.h),
                  Text(paymentOptions[index].name, style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}