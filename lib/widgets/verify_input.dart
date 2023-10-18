import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VerifyInput extends StatelessWidget{
  const VerifyInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w,
      height: 20.w,
      child: const TextField(
        maxLength: 1,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          counterText: "",
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

}