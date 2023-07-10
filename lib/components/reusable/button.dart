import 'package:chatapp/components/styls/colors.dart';
import 'package:flutter/material.dart';

//ignore_for_file: prefer_const_constructors
// ignore: must_be_immutable
class Mybutton extends StatelessWidget {
  final String btnName;
  final Function buttonHaddle;
  const Mybutton(
      {super.key, required this.btnName, required this.buttonHaddle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyColor.btnColor,
        ),
        child: Center(
          child: Text(
            btnName,
            style: TextStyle(
                fontSize: 18,
                color: MyColor.btntextColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () => buttonHaddle(),
    );
  }
}
