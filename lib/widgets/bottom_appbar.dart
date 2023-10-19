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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Your Digital Banking Partner.", style: Theme.of(context).textTheme.headlineLarge),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 50.w,
                  height: 48.sp,
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: const Text("Get Started")
                  ),
                ),
                SizedBox(width: 4.w),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset("assets/search.png", width: 25.sp,),
                ),
                SizedBox(width: 3.w),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset("assets/apple.png", width: 25.sp,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}