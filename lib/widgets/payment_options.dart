import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//models
import 'package:mobile_banking_app/models/payment_options.dart';

class PaymentOption extends StatefulWidget{
  const PaymentOption({super.key});

  @override
  State<StatefulWidget> createState() => PaymentOptionUI();

}

class PaymentOptionUI extends State<PaymentOption>{
  List<PaymentOptions> paymentOptions = [
    PaymentOptions(icon: 'assets/send-money.png', name: 'Send Money'),
    PaymentOptions(icon: 'assets/payment.png', name: 'Receive Money'),
    PaymentOptions(icon: 'assets/phone-banking.png', name: 'Mobile Recharge'),
    PaymentOptions(icon: 'assets/pay-bill.png', name: 'Pay All Bills'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: paymentOptions.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.sp,
        crossAxisSpacing: 10.sp,
      ),
      itemBuilder: (context, index){
        return Container(
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
                Image.asset(paymentOptions[index].icon, height: 30.sp),
                SizedBox(height: 2.h),
                Text(paymentOptions[index].name, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        );
      },
    );
  }

}