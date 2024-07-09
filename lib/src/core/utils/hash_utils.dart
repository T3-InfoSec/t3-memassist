import 'dart:convert';
import 'package:crypto/crypto.dart';

/// A utility class for generating hashes.
class HashUtils {

  /// Generates a SHA-256 hash for the given [input] string.
  ///
  /// Returns the hash as a [String].
  static String generateSHA256(String input) {
    var bytes = utf8.encode(input);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}