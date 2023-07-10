import 'package:chatapp/screens/login.dart';
import 'package:chatapp/components/styls/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/Register/btn.dart';
import '../components/Register/check_box.dart';
import '../components/Register/text_from_field.dart';
import '../configs/db_con.dart';

//ignore_for_file: prefer_const_constructors
// ignore: must_be_immutable
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool defaultCheckVal = false;
  void isChecked() {
    // print(defaultCheckVal);
    setState(() {
      defaultCheckVal = !defaultCheckVal;
    });
  }

  final _formKey = GlobalKey<FormState>();
  TextStyle textStyle = const TextStyle(fontSize: 16);

  List userTextfieldData = [];
  @override
  void initState() {
    runDB();
    // DatabaseConfig().deleteDB();
    super.initState();
  }

  runDB() async {
    DatabaseConfig databaseConfig = DatabaseConfig();
    if (await databaseConfig.databaseExists()) {
      databaseConfig.openDB();
    } else {
     await databaseConfig.createDB();
      await databaseConfig.createTable();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 1),
              Text('create_an_account'.tr, style: textStyle),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ------ email ------------
                          Text('email'.tr, style: textStyle),
                          SizedBox(height: 5),

                          MyTextFormField(
                            obscureText: false,
                            nameTextInput: 'email',
                            list: userTextfieldData,
                          ),
                          SizedBox(height: 10),

                          //------- password------------
                          Text('password'.tr, style: textStyle),
                          SizedBox(height: 5),

                          MyTextFormField(
                            obscureText: true,
                            nameTextInput: 'password',
                            list: userTextfieldData,
                          ),
                          SizedBox(height: 10),

                          //-------username-------------
                          Text('username'.tr, style: textStyle),
                          SizedBox(height: 5),

                          MyTextFormField(
                            obscureText: false,
                            nameTextInput: 'username',
                            list: userTextfieldData,
                          ),
                          SizedBox(height: 10),

                          // check box here ---------------------
                          MyCheckBox(
                              value_: defaultCheckVal, isChecked: isChecked),
                        ],
                      ),
                    )),
              ),

              /// create account btn--------------//
              MyButton(formKey: _formKey, check_val: defaultCheckVal),
              SizedBox(height: 40),
              // taggle to login
              GestureDetector(
                  child: Text('haveAccount'.tr,
                      style: TextStyle(color: MyColor.testLinkColor)),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyLogin()))),
            ],
          ),
        ),
      ),
    );
  }
}
