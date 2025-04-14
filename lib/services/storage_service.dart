import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class StorageService {
  static Future<File> _getFile(String fileName) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$fileName');
  }

  static Future<void> write(String fileName, String content) async {
    final file = await _getFile(fileName);
    await file.writeAsString(content);
  }

  static Future<String?> read(String fileName) async {
    try {
      final file = await _getFile(fileName);
      return await file.readAsString();
    } catch (_) {
      return null;
    }
  }
}
