import 'package:flutter/material.dart';

InputDecoration inputDecorationStyle(String value){
  return InputDecoration(
    filled: true,
    hintText: value,
    hintStyle: const TextStyle(
      fontFamily: 'Hind',
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
  );
}