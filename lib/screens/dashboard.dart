import 'package:chatapp/components/styls/colors.dart';

import 'package:chatapp/screens/chat_page.dart';
import 'package:chatapp/screens/setting.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/reusable/bottom_navbar.dart';
import '../conrollers/user_controller.dart';

//ignore_for_file: prefer_const_constructors
// ignore: must_be_immutable
class MyDashboard extends StatefulWidget {
  final String username;
  final int loggedId;
  const MyDashboard(
      {super.key, required this.username, required this.loggedId});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  void initState() {
    readAllUsers();

    super.initState();
  }

  UserController userController = Get.put(UserController());

  readAllUsers() async {
    await userController.readUsersController();
  }

  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      bottomNavigationBar: MyBottomNavigationBar(
        key: _bottomNavigationKey,
        currentIndex: _page,
        onTap: (index) {
          setState(() {
            _page = index;
          });
          if (_page == 1) {
            Get.to(MySetting());
          }
        },
      ),
      body: Column(
        children: [
          SizedBox(height: 50.0),
          Text(
            '${'greating'.tr} ${widget.username}',
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: userController.userList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: ListTile(
                      tileColor: Colors.white,
                      leading: Icon(
                        Icons.account_circle,
                        size: 50,
                        color: Colors.blue,
                      ),
                      title: Text(userController.userList[index].username!),
                      trailing: Icon(Icons.chat),
                      onTap: () => Get.to(ChatPage(
                        chatterID: userController.userList[index].id!,
                        name: userController.userList[index].username!,
                        loggedId: widget.loggedId,
                      )),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
