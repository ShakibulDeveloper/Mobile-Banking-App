import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//models
import 'package:mobile_banking_app/models/payment_options.dart';

class CryptoPaymentOptions extends StatefulWidget{
  const CryptoPaymentOptions({super.key});

  @override
  State<StatefulWidget> createState() => CryptoPaymentOptionsUI();

}

class CryptoPaymentOptionsUI extends State<CryptoPaymentOptions>{
  List<PaymentOptions> paymentOptionList = [
    PaymentOptions(icon: "assets/payment.png", name: "Buy"),
    PaymentOptions(icon: "assets/loan.png", name: "Sell"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: paymentOptionList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
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
                Image.asset(paymentOptionList[index].icon, height: 32.sp),
                SizedBox(height: 2.h),
                Text(paymentOptionList[index].name, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        );
      },
    );
  }

}