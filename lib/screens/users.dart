import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//models
import 'package:mobile_banking_app/models/users.dart';

//widgets
import 'package:mobile_banking_app/widgets/search_bar.dart';
import 'package:mobile_banking_app/widgets/active_users.dart';
import 'package:mobile_banking_app/widgets/user_profile_pic.dart';
import 'package:mobile_banking_app/widgets/payment_bottom_modal.dart';

class UserScreen extends StatefulWidget{
  late String title;
  List<Users> userList;
  UserScreen({super.key, required this.userList, required this.title});

  @override
  State<StatefulWidget> createState() => UserScreenUI();
  
} 

class UserScreenUI extends State<UserScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: [
              Text(widget.title, style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 2.h),
              appSearchBar(context, "Search Users by Name or Phone Number..."),
              SizedBox(height: 2.h),
              Text("All The Users", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 1.h),
              ActiveUserGrid(userList: widget.userList),
              SizedBox(height: 2.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.userList.length,
                itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        if(index != 0){
                          paymentBottomSheet(context,
                            widget.userList[index].profilePic,
                            widget.userList[index].name,
                            widget.userList[index].phoneNumber,
                            "Send Money",
                          );
                        }
                      },
                      child: Card(
                        child: ListTile(
                          leading: UserProfilePic(profilePic: widget.userList[index].profilePic),
                          title: Text(index == 0 ? "You" : widget.userList[index].phoneNumber, style: Theme.of(context).textTheme.bodyLarge),
                          subtitle: Text(index == 0 ? widget.userList[index].phoneNumber : widget.userList[index].name, style: Theme.of(context).textTheme.bodySmall),
                        ),
                      ),
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}