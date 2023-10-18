import 'package:flutter/material.dart';

InputDecoration inputDecorationStyle(String value){
  return InputDecoration(
    filled: true,
    hintText: value,
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
  );
}