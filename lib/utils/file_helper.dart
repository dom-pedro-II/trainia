import 'dart:convert';
import '../services/storage_service.dart';

class FileHelper {
  static Future<Map<String, dynamic>?> readJson(String fileName) async {
    final content = await StorageService.read(fileName);
    if (content == null) return null;
    return jsonDecode(content);
  }

  static Future<void> writeJson(String fileName, dynamic data) async {
    final jsonString = jsonEncode(data);
    await StorageService.write(fileName, jsonString);
  }
}
