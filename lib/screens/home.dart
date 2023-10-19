import 'package:flutter/material.dart';
import 'package:mobile_banking_app/widgets/recent_activity.dart';
import 'package:sizer/sizer.dart';

//widgets
import 'package:mobile_banking_app/widgets/user_profile_pic.dart';
import 'package:mobile_banking_app/widgets/payment_options.dart';
import 'package:mobile_banking_app/widgets/active_users.dart';
import 'package:mobile_banking_app/widgets/bottom_navbar.dart';

//models
import 'package:mobile_banking_app/models/users.dart';
import 'package:mobile_banking_app/models/currency.dart';

//style


class HomeScreenState extends StatefulWidget{
  const HomeScreenState({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenUI();

}

class HomeScreenUI extends State<HomeScreenState>{
  int activeUser = 0;
  int activeCurrency = 0;

  List<Users> userList = [
    Users(profilePic: 'assets/users/user1.png', name: 'Md Shakibul Alam', phoneNumber: '0814657513', balance: 1537.0),
    Users(profilePic: 'assets/users/user2.png', name: 'Charlotte', phoneNumber: '0324846542', balance: 0),
    Users(profilePic: 'assets/users/user3.png', name: 'Jhon Doe', phoneNumber: '04488765443', balance: 0),
    Users(profilePic: 'assets/users/user4.png', name: 'Angelica', phoneNumber: '07988600531', balance: 0),
  ];

  List<Currency> currencyList = [
    Currency(status: 1, icon: Icons.currency_exchange, name: "USD"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UserProfilePic(profilePic: userList[activeUser].profilePic),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: [
              SizedBox(height: 3.h),
              Text('\$${userList[activeUser].balance.toStringAsFixed(1)}', style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 1.h),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 40.w,
                  child: OutlinedButton.icon(
                      onPressed: (){},
                      icon: Icon(currencyList[activeCurrency].icon, size: 20.sp),
                      label: Text(currencyList[activeCurrency].name, style: TextStyle(fontFamily: "hind", fontSize: 16.sp)),
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Text("Here are some things to do", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 1.h),
              const PaymentOption(),
              SizedBox(height: 3.h,),
              Text("All Active Users", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 2.h),
              ActiveUserGrid(userList: userList),
              SizedBox(height: 3.h,),
              Text("Your Recent Activities", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 1.h),
              RecentActivityList(userList: userList),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

}