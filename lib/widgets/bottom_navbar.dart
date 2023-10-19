import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//styles
import 'package:mobile_banking_app/styles/theme_color.dart';

class BottomNavBar extends StatelessWidget{
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: ThemeColor.primaryColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      iconSize: 20.sp,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.currency_bitcoin_outlined), label: "Crypto"),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Offers"),
        BottomNavigationBarItem(icon: Icon(Icons.currency_exchange), label: "Activity"),
      ],
    );
  }

}