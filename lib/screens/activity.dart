import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//models
import 'package:mobile_banking_app/models/users.dart';

//widgets
import 'package:mobile_banking_app/widgets/primary_appbar.dart';
import 'package:mobile_banking_app/widgets/bottom_navbar.dart';
import 'package:mobile_banking_app/widgets/recent_activity.dart';

class ActivityScreen extends StatelessWidget{
  late String activeUser;

  List<Users> userList = [
    Users(profilePic: 'assets/users/user1.png', name: 'Md Shakibul Alam', phoneNumber: '0814657513', balance: 1537.02),
    Users(profilePic: 'assets/users/user2.png', name: 'Charlotte', phoneNumber: '0324846542', balance: 0),
    Users(profilePic: 'assets/users/user3.png', name: 'Jhon Doe', phoneNumber: '04488765443', balance: 0),
    Users(profilePic: 'assets/users/user4.png', name: 'Angelica', phoneNumber: '07988600531', balance: 0),
  ];

  ActivityScreen({super.key, required this.activeUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar(activeUser),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: [
              SizedBox(height: 1.h),
              Text("All Activities", style: Theme.of(context).textTheme.bodySmall),
              RecentActivityList(userList: userList, itemToShow: "All",),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 3, activeUserProfilePic: activeUser),
    );
  }

}