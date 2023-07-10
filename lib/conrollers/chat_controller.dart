import 'package:chatapp/models/chat_model.dart';
import 'package:chatapp/services/chat_dao.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatDAO chatDAO = ChatDAO();
  RxList<Chat> chatModelList = <Chat>[].obs;

  //insert controller
  chatController(
      int loggedId, int chatterId, String text, String dateTime) async {
    Chat chat = Chat(
        loggedId: loggedId,
        chatterId: chatterId,
        text: text,
        dateTime: dateTime);
    // send model to DAO

    int id = await chatDAO.insertChat(chat);
    chat.chatID = id;

    chatModelList.add(chat);
  }

  // read data controller
  chatReadController(int loggedId, int chatterID) async {
    List chat_ = await chatDAO.readChat(loggedId, chatterID);
    for (var chat in chat_) {
     Chat chatModel = Chat(
          loggedId: chat['loggedid_'],
          chatterId: chat['chatterid_'],
          chatID: chat['chatId_'],
          text: chat['text_'],
          dateTime: chat['dateTime_']);
    
    chatModelList.add(chatModel);
    }
    
  }
}
