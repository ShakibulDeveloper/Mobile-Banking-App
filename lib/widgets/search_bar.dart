import 'package:flutter/material.dart';

TextField appSearchBar(context, String value){
  return TextField(
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.search),
      hintText: value,
      hintStyle: Theme.of(context).textTheme.bodySmall,
      filled: true,
      border: const OutlineInputBorder(borderSide: BorderSide.none),
    ),
  );
}