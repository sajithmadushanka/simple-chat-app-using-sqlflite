import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseConfig {
  String dbName = 'ChatApp.db';
  String tableName = 'User';
  createDB() async {
    var db = await openDatabase(dbName);
    // print('DB has been created');
    await db.close();
  }

  /// create db path
  Future<String> getPath() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    return path;
  }

// Delete the database
  deleteDB() async {
    await deleteDatabase(await getPath());
    // print('DB has been deleted');
  }

 /// check whether db has exists or not
  Future<bool> databaseExists() async{
        return  databaseFactory.databaseExists(await getPath());
  }
   

// open the database
  Future<Database> openDB() async {
    Database database = await openDatabase(await getPath(),
        version: 1, onCreate: (Database db, int version) async {});
    return database;
  }

  Future<void> createTable() async {
    var db = await openDB();
    // When creating the db, create the table
    await db.execute(
        'CREATE TABLE  $tableName (id_ INTEGER PRIMARY KEY, email_ VARCHAR, username_ VARCHAR,  password_ BLOB)');
    // print('table has been created');
  }

// create table for chats data
  Future<void> createtableChat() async {
    String cTableName = 'Chat';
    var db = await openDB();
    await db.execute(
        'CREATE TABLE IF NOT EXISTS $cTableName (chatId_ INTEGER PRIMARY KEY , loggedid_ INTEGER ,chatterid_ INTEGER , dateTime_ VARCHAR, text_ VARCHAR)');
    // print('chat table has been created');
  }


  // logout
  dbClose()async{
     var db = await openDB();
    await db.close();
  }
}
