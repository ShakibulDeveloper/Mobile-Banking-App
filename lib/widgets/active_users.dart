import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//models
import 'package:mobile_banking_app/models/users.dart';

//widgets
import 'package:mobile_banking_app/widgets/user_profile_pic.dart';

//styles
import 'package:mobile_banking_app/styles/theme_color.dart';

class ActiveUserGrid extends StatefulWidget{
   List<Users> userList = [];
   ActiveUserGrid({super.key, required this.userList});

  @override
  State<StatefulWidget> createState() => ActiveUserGridUI();

}

class ActiveUserGridUI extends State<ActiveUserGrid>{
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.userList.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8.sp,
      ),
      itemBuilder: (context, index){
        if(index != 0){
          return UserProfilePic(profilePic: widget.userList[index].profilePic);
        }else{
          return const CircleAvatar(
            backgroundColor: Colors.white60,
            child: Icon(Icons.add, color: ThemeColor.primaryColor),
          );
        }
      },
    );
  }

}