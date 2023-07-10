import 'package:chatapp/conrollers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../configs/db_con.dart';

class ChatPage extends StatefulWidget {
  final int chatterID;
  final String name;
  final int loggedId;
  const ChatPage(
      {super.key,
      required this.chatterID,
      required this.name,
      required this.loggedId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

//ignore_for_file: prefer_const_constructors
class _ChatPageState extends State<ChatPage> {
  InputDecoration dec = const InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
  );
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.clear();
    super.dispose();
  }

  ChatController chatController = Get.put(ChatController());
  @override
  void initState() {
    DatabaseConfig().createtableChat();
    chatController.chatReadController(widget.loggedId, widget.chatterID);
    super.initState();
  }

// read chat
  loadChat(int loggedId, int chatterId) {}
//sendMsg()----------

  sendMsg() {
    String msg = controller.text.toString().trim();
    String dateTime = DateTime.now().toString();
    chatController.chatController(
        widget.loggedId, widget.chatterID, msg, dateTime);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 600,
                child: Obx(
                  () => ListView.builder(
                    itemCount: chatController.chatModelList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 200,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 7, 255, 255),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chatController.chatModelList[index].text!,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    chatController
                                        .chatModelList[index].dateTime!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: controller,
                          decoration: dec,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      color: Colors.blue,
                      onPressed: () => sendMsg(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
