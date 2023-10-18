import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//screens
import 'package:mobile_banking_app/screens/login.dart';

class BottomAppBarWidget extends StatelessWidget{
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text("Your Digital Banking Partner.", style: Theme.of(context).textTheme.headlineLarge),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 52.w,
                  height: 54.sp,
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: const Text("Get Started!")
                  ),
                ),
                SizedBox(width: 2.w),
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: Image.asset("assets/search.png", width: 24.sp,),
                ),
                SizedBox(width: 2.w),
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: Image.asset("assets/apple.png", width: 24.sp,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}