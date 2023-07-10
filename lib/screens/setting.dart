import 'package:chatapp/components/reusable/button.dart';
import 'package:chatapp/components/styls/colors.dart';
import 'package:chatapp/components/reusable/textfiled.dart';
import 'package:chatapp/configs/db_con.dart';
import 'package:chatapp/screens/login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:select_form_field/select_form_field.dart';

import '../components/reusable/bottom_navbar.dart';

//ignore_for_file: prefer_const_constructors
// ignore: must_be_immutable
class MySetting extends StatefulWidget {
  const MySetting({super.key});

  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  final TextEditingController controller = TextEditingController();

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'english',
      'label': 'English',
      'icon': Icon(Icons.language),
    },
    {
      'value': 'sinhala',
      'label': 'Sinhala',
      'icon': Icon(Icons.language),
    },
  ];

  /// change language
  void changeLanguage(String lang) {
    if (lang == 'sinhala') {
      Get.updateLocale(Locale('si_LK'));
    } else if (lang == 'english') {
      Get.updateLocale(Locale('en_US'));
    } else {
      // print('there is no language to change');
    }
  }

  // logout button
  logout() {
    // Close connections and dispose resources
    DatabaseConfig().dbClose();

    Get.to(MyLogin());
  }

  final int _page = 1;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      bottomNavigationBar: MyBottomNavigationBar(
          key: _bottomNavigationKey,
          currentIndex: _page,
          onTap: (index) {
            if (index == 0) {
              Get.back();
            }
          }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'settings'.tr,
            style: TextStyle(fontSize: 20),
          ),

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'username'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                MytextFiled(controller: controller),
                Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'SaveChanges'.tr,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ))),
              ],
            ),
          ),
          // change language----------------------
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'english',

                  icon: Icon(Icons.language_outlined),
                  labelText: 'selected_langauge'.tr,
                  items: _items,
                  onChanged: (val) => changeLanguage(val),
                  onSaved: (newValue) {},
                ),
              ],
            ),
          ),

          ///logout -------------------------------------
          Mybutton(btnName: 'logout'.tr, buttonHaddle: logout),
        ],
      ),
    );
  }
}
