import 'package:sqflite/sqflite.dart';

import '../configs/db_con.dart';
import '../models/chat_model.dart';

class ChatDAO {
  String tableName = 'Chat';
  String loggedId = 'loggedid_';
  String chaterId = 'chatterid_';
  String text = 'text_';
  String dateTime = 'dateTime_';
  // make connection
  Future<Database> makeConnecion() async {
    return await DatabaseConfig().openDB();
  }

  // insert chat
  Future<int> insertChat(Chat chat) async {
    var database = await makeConnecion();
    return await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO $tableName($loggedId, $chaterId, $text, $dateTime) VALUES(\'${chat.loggedId}\', \'${chat.chatterId}\', \'${chat.text}\', \'${chat.dateTime}\')');
      // print('inserted1: $id1');
      return id1;
    });
  }

  // read chat
  Future<List> readChat(int loggedId_, int chatterId_) async {
    var database = await makeConnecion();
    List<Map> chatList = await database.rawQuery(
        'SELECT * FROM $tableName WHERE $loggedId IN ($loggedId_, $chatterId_) AND $chaterId IN ($chatterId_, $loggedId_)'
);
    // print(chatList);
    return chatList;
  }
}
