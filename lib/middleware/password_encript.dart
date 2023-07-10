import 'package:encrypt/encrypt.dart';

class Encryption {
  passwordEncrypt(String text) {
    var key = Key.fromUtf8('my 32 length key................');
    var iv = IV.fromLength(16);
    var encrypter = Encrypter(AES(key));
    var encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  String passwordDecrypt(String  encryptedBase64) {
    
    var encrypted = Encrypted.fromBase64(encryptedBase64);
    var key = Key.fromUtf8('my 32 length key................');
    var iv = IV.fromLength(16);
    var encrypter = Encrypter(AES(key));
    var decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }
}
