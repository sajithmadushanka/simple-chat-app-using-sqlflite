import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  
  final GlobalKey<FormState> formKey;
  // ignore: non_constant_identifier_names
  final bool check_val;
  // ignore: non_constant_identifier_names
  MyButton({super.key, required this.formKey, required this.check_val});
  TextStyle textStyle = const TextStyle(fontSize: 18, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.deepPurple),
        child: Center(
            child: Text(
          'create_an_account'.tr,
          style: textStyle,
        )),
      ),
      onTap: () {
        if (formKey.currentState!.validate() && check_val) {
          formKey.currentState!.save();
        }
      },
    );
  }
}
