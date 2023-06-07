import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:shared_preferences/shared_preferences.dart';

class Encryptor {

//esta clase era para encriptar la contraseña pero no se implementó
  static encryptAES(text) async {

    // final pref = await SharedPreferences.getInstance();

    final key = encrypt.Key.fromSecureRandom(32);

    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted;
  }

  static decryptAES(text) async {
    final key = encrypt.Key.fromSecureRandom(32);
    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.decrypt(text, iv: iv);
    return encrypted;
  }
}
