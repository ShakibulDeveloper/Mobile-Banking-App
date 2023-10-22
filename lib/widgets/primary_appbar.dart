import 'package:flutter/material.dart';

//screens
import 'package:mobile_banking_app/screens/activity.dart';

//widgets
import 'package:mobile_banking_app/widgets/user_profile_pic.dart';

AppBar primaryAppBar(String activeUserProfilePic){
 return AppBar(
   title: UserProfilePic(profilePic: activeUserProfilePic),
   actions: [
     IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
     IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
   ],
 );
}