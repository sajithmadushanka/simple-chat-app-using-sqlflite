import 'package:chatapp/middleware/password_encript.dart';
import 'package:chatapp/models/user_model.dart';
import 'package:chatapp/services/user_dao.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Encryption encryption = Encryption();
  UserDAO userDAO = UserDAO();

  var userList = <User>[].obs;

  // insert controller
  Future<int> userInsertController(
      String email, String username, String password) async {
    var encryptedPs = encryption.passwordEncrypt(password);

    User user = User(email: email, username: username, password: encryptedPs);
    int id = await userDAO.insertUser(user);
    return id;
  }

  // read contoller
  readUsersController() async {
    List users = await userDAO.getUsers();
    for (var user in users) {
      int id = user['id_'];
      String email = user['email_'];
      String username = user['username_'];
      String password = user['password_'];

      // decryption password
      String decrytedPs = encryption.passwordDecrypt(password);

      // // user object
      User newuser =
          User(id: id, email: email, password: decrytedPs, username: username);
      userList.add(newuser);
    }
  }

  // login user controller
  Future<User> loginUserController(String email, String password) async {
    var encryptedPs = encryption.passwordEncrypt(password);
    User loginUser = User(email: email, password: encryptedPs);
    List loguser = await userDAO.loginUser(loginUser);
    String uername = loguser[0]['username_'];
    int id = loguser[0]['id_'];

    User user = User(id: id, username: uername);
    return user;
  }
  // update controller
}
