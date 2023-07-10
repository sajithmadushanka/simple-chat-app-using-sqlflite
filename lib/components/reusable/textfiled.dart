import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MytextFiled extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller ;
   MytextFiled({super.key,required this.controller});
    InputDecoration dec = const InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return   TextField(controller: controller, decoration: dec);
  }
}