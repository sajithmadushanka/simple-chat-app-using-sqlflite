import 'package:chatapp/configs/db_con.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user_model.dart';

class UserDAO {
  // database columns -----------------------
  String tableName = 'User';
  String email = 'email_';
  String username = 'username_';
  String password = 'password_';

  // make connection to DAO
  Future<Database> makeConnecion() async {
    return await DatabaseConfig().openDB();
  }

  // insert data to db ---------------
  Future<int> insertUser(User user) async {
    var database = await makeConnecion();
    return await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO $tableName($email, $username, $password) VALUES(\'${user.email}\', \'${user.username}\', \'${user.password}\')');
      // print('inserted1: $id1');
      return id1;
    });
  }

  // read data from db------------------
  Future<List> getUsers() async {
    // Get the records
    var database = await makeConnecion();
    List<Map> list = await database.rawQuery('SELECT * FROM $tableName');
    return list;
  }

  // get user data from email and password
  Future<List> loginUser(User user) async {
    var database = await makeConnecion();
    List<Map> loguser = await database.rawQuery(
        'SELECT * FROM $tableName where email_ =\'${user.email}\' AND password_ = \'${user.password}\'');
    return loguser;
    
  }
  // update data ----------------

  // delete data-----------
}
