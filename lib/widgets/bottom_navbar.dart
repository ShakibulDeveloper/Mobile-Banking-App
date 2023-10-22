import 'package:flutter/material.dart';
import 'package:mobile_banking_app/screens/home.dart';
import 'package:sizer/sizer.dart';

//models
import 'package:mobile_banking_app/models/users.dart';

//screens
import 'package:mobile_banking_app/screens/crypto.dart';
import 'package:mobile_banking_app/screens/offers.dart';
import 'package:mobile_banking_app/screens/activity.dart';

//styles
import 'package:mobile_banking_app/styles/theme_color.dart';

class BottomNavBar extends StatefulWidget{
  late int currentIndex;
  late String activeUserProfilePic;
  BottomNavBar({super.key, required this.currentIndex, this.activeUserProfilePic = 'assets/users/default.png'});

  @override
  State<StatefulWidget> createState() => BottomNavBarUI();

}

class BottomNavBarUI extends State<BottomNavBar>{
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  //=======BOTTOM_NAV_NAVIGATION=====
  bottomNavNavigator(int index){
    if(index == 1){
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CryptoScreen(activeUser: widget.activeUserProfilePic)),
             (route) => false); //CryptoScreenRoute
    }
    else if(index == 2){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OfferScreen(activeUser: widget.activeUserProfilePic)),
              (route) => false); //OfferScreenRoute
    }
    else if(index == 3){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ActivityScreen(activeUser: widget.activeUserProfilePic)),
              (route) => false); //ActivityScreenRoute
    }
    else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreenState()),
              (route) => false); //HomeScreenRoute
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: ThemeColor.primaryColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      iconSize: 20.sp,
      currentIndex: _currentIndex,
      onTap: (index){
        _currentIndex = index;
        bottomNavNavigator(index);
        setState(() {});
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.currency_bitcoin_outlined), label: "Crypto"),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Offers"),
        BottomNavigationBarItem(icon: Icon(Icons.currency_exchange), label: "Activity"),
      ],
    );
  }

}