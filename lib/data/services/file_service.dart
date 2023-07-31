import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:store_app/data/enums/enums.dart';

class FileService {
  static final _storage = FirebaseStorage.instance;
  static void addFile({
    required FileType type,
    required File file,
  }) {}
  static void removeFile() {}
  static void updateFile() {}
  static Future<String> getFileUrl() async {
    return '';
  }
}
