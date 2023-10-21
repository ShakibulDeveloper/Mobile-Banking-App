import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//models
import 'package:mobile_banking_app/models/crypto_currency.dart';

//widgets
import 'package:mobile_banking_app/widgets/bottom_navbar.dart';
import 'package:mobile_banking_app/widgets/primary_appbar.dart';
import 'package:mobile_banking_app/widgets/crypto_payment_options.dart';
import 'package:mobile_banking_app/widgets/crypto_recent_activity.dart';

class CryptoScreen extends StatefulWidget{
  late String activeUser;
  CryptoScreen({super.key, required this.activeUser});

  @override
  State<StatefulWidget> createState() => CryptoScreenUI();

}

class CryptoScreenUI extends State<CryptoScreen>{
  int activeCurrency = 0;

  List<CryptoCurrency> activeUserCrypto = [
    CryptoCurrency(icon: 'assets/currency/bitcoin.png', name: "Bitcoin", amount: 0.000034, code: "BTC"),
    CryptoCurrency(icon: 'assets/currency/ethereum.png', name: "Ethereum", amount: 0.00062, code: "ETH"),
  ];

  //=====CRYPTO_CURRENCY_CHANGE=====
  void onPressedCurrencyChange(){
    if(activeCurrency == 0){
      activeCurrency = 1;
    }else if(activeCurrency == 1){
      activeCurrency = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar(widget.activeUser),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: [
              SizedBox(height: 3.h),
              Text('${activeUserCrypto[activeCurrency].amount} ${activeUserCrypto[activeCurrency].code} ', style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 1.h),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 100.w,
                  child: OutlinedButton.icon(
                    onPressed: (){
                      onPressedCurrencyChange();
                    },
                    icon: Image.asset(activeUserCrypto[activeCurrency].icon, width: 18.sp),
                    label: Text(activeUserCrypto[activeCurrency].name, style: TextStyle(fontFamily: "hind", fontSize: 16.sp)),
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Text("Here are some things to do", style: Theme.of(context).textTheme.bodySmall),
              const CryptoPaymentOptions(),
              SizedBox(height: 3.h,),
              Text("Your Recent Activities", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 1.h),
              const CryptoRecentActivityList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1, activeUserProfilePic: widget.activeUser),
    );
  }

}