import 'package:chatapp/components/styls/colors.dart';
import 'package:chatapp/components/reusable/textfiled.dart';
import 'package:chatapp/models/user_model.dart';
import 'package:chatapp/screens/dashboard.dart';
import 'package:chatapp/screens/register.dart';

import 'package:flutter/material.dart';

import '../components/reusable/button.dart';
import 'package:get/get.dart';

import '../conrollers/user_controller.dart';

//ignore_for_file: prefer_const_constructors
// ignore: must_be_immutable
class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  TextStyle textStyle = const TextStyle(fontSize: 16);
  UserController userController = Get.put(UserController());

// login button function
  login(context) async {
   

    User user = await userController.loginUserController(
        emailController.text, passwordController.text);

    Get.to(MyDashboard(username: user.username!, loggedId: user.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Center(
                  child: Column(
                    children: [
                      Text('welcome_back'.tr, style: textStyle),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('email'.tr, style: textStyle),
                          SizedBox(height: 10),
                          MytextFiled(controller: emailController),
                          SizedBox(height: 20),
                          Text('password'.tr, style: textStyle),
                          SizedBox(height: 10),
                          MytextFiled(controller: passwordController),
                          SizedBox(height: 20),
                        ],
                      ),

                      // Button
                      Mybutton(
                        btnName: 'login'.tr,
                        buttonHaddle: () => login(context),
                      ),

                      // Toggle with register
                      GestureDetector(
                        child: Text(
                          'noAccount'.tr,
                          style: TextStyle(
                              fontSize: 16, color: MyColor.testLinkColor),
                        ),
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Register(),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
