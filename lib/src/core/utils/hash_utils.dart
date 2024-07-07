import 'dart:convert';
import 'package:crypto/crypto.dart';

class HashUtils {

  static String generateSHA256(String input) {
    var bytes = utf8.encode(input);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}