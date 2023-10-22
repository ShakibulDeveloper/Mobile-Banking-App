import 'package:flutter/material.dart';
import 'package:mobile_banking_app/widgets/recent_activity.dart';
import 'package:sizer/sizer.dart';

//widgets
import 'package:mobile_banking_app/widgets/payment_options.dart';
import 'package:mobile_banking_app/widgets/active_users.dart';
import 'package:mobile_banking_app/widgets/bottom_navbar.dart';
import 'package:mobile_banking_app/widgets/primary_appbar.dart';

//models
import 'package:mobile_banking_app/models/users.dart';
import 'package:mobile_banking_app/models/currency.dart';

//style


class HomeScreenState extends StatefulWidget{
  late String moneySpend;
  HomeScreenState({super.key, this.moneySpend = '0'});

  @override
  State<StatefulWidget> createState() => HomeScreenUI();

}

class HomeScreenUI extends State<HomeScreenState>{
  int activeUser = 0;
  int activeCurrency = 0;
  late double result;

  List<Users> userList = [
    Users(profilePic: 'assets/users/user1.png', name: 'Md Shakibul Alam', phoneNumber: '0814657513', balance: 1537.02),
    Users(profilePic: 'assets/users/user2.png', name: 'Charlotte', phoneNumber: '0324846542', balance: 0),
    Users(profilePic: 'assets/users/user3.png', name: 'Jhon Doe', phoneNumber: '04488765443', balance: 0),
    Users(profilePic: 'assets/users/user4.png', name: 'Angelica', phoneNumber: '07988600531', balance: 0),
  ];

  List<Currency> currencyList = [
    Currency(status: 1, icon: 'assets/currency/usd.png', name: "USD", code: "\$"),
    Currency(status: 1, icon: 'assets/currency/euro.png', name: "EURO", code: "€"),
    Currency(status: 1, icon: 'assets/currency/bdt.png', name: "BDT", code: "TK "),
  ];

  //=====CURRENCY_CONVERT======
  String currencyConvert(){
    if(activeCurrency == 0){
      return userList[0].balance.toStringAsFixed(2).toString();
    }
    else if(activeCurrency == 1){
      result = userList[0].balance*0.94;
      return result.toStringAsFixed(2).toString();
    }
    else if(activeCurrency == 2){
      result = userList[0].balance*110.24;
      return result.toStringAsFixed(2).toString();
    }else{
      return userList[0].balance.toStringAsFixed(2).toString();
    }
  }

  //=====SELECT_CURRENCY_DIALOG======
  selectCurrencyDialogue(){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Select Currency', style: Theme.of(context).textTheme.bodyLarge),
        content: SizedBox(
          width: 100.w,
          height: 60.sp,
          child: GridView.builder(
            itemCount: currencyList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15.sp,
            ),
            itemBuilder: (context, index){
              return GestureDetector(
                  onTap: (){
                    activeCurrency = index;
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Image.asset(currencyList[index].icon)
              );
            },
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    userList[activeUser].balance -= double.parse(widget.moneySpend);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar(userList[activeUser].profilePic),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: [
              SizedBox(height: 3.h),
              Text('${currencyList[activeCurrency].code}${currencyConvert()}', style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 1.h),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 40.w,
                  child: OutlinedButton.icon(
                      onPressed: (){
                        selectCurrencyDialogue();
                      },
                      icon: Image.asset(currencyList[activeCurrency].icon, width: 18.sp),
                      label: Text(currencyList[activeCurrency].name, style: TextStyle(fontFamily: "hind", fontSize: 16.sp)),
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Text("Here are some things to do", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 1.h),
              PaymentOption(userList: userList),
              SizedBox(height: 3.h,),
              Text("All Active Users", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 2.h),
              ActiveUserGrid(userList: userList),
              SizedBox(height: 3.h,),
              Text("Your Recent Activities", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 1.h),
              RecentActivityList(userList: userList, itemToShow: '3'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0, activeUserProfilePic: userList[activeUser].profilePic),
    );
  }

}