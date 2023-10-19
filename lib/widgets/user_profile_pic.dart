import 'package:flutter/material.dart';

class UserProfilePic extends StatefulWidget{
  late String profilePic;
  UserProfilePic({super.key, required this.profilePic});

  @override
  State<StatefulWidget> createState() => UserProfilePicUI();

}

class UserProfilePicUI extends State<UserProfilePic>{
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage: AssetImage(widget.profilePic),
    );
  }

}