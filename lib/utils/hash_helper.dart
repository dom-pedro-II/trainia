import 'dart:convert';
import 'package:crypto/crypto.dart';

class HashHelper {
  static String hash(String input) {
    final bytes = utf8.encode(input);
    return sha256.convert(bytes).toString();
  }
}
