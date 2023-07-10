import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../conrollers/user_controller.dart';
import '../../screens/login.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  final bool obscureText;
  final String nameTextInput;
  List? list;
  MyTextFormField(
      {super.key,
      required this.obscureText,
      required this.nameTextInput,
      this.list});

  InputDecoration dec = const InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
  );

  validate(value) {
    if (nameTextInput == 'email') {
      if (value == null || value.isEmpty) {
        return 'Please enter Email';
      }
    } else if (nameTextInput == 'password') {
      if (value == null || value.isEmpty) {
        return 'Please enter Password';
      }
    } else if (nameTextInput == 'username') {
      if (value == null || value.isEmpty) {
        return 'Please enter User Name';
      }
    }

    return null;
  }

  save_(newvalue) {
    list!.add(newvalue);
    if (list!.length == 3) {
      sendData();
    }
  }

  /// send data to controller
  sendData() async {
    int id = await UserController()
        .userInsertController(list![0], list![2], list![1]);
    list!.clear();
    // navigate login page
    if (id > 0) {
      Get.to(const MyLogin());
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: dec,
      validator: (value) => validate(value),
      onSaved: (newValue) => save_(newValue),
    );
  }
}
