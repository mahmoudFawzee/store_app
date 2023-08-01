import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:store_app/data/enums/enums.dart';
import 'package:store_app/data/services/base/base_service.dart';

class FileService extends BaseService{
  static final _storage = FirebaseStorage.instance;
  static void addFile({
    required FileType type,
    required File file,
  }) {}
  
  @override
  create() {
    // TODO: implement create
    throw UnimplementedError();
  }
  
  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  read() {
    // TODO: implement read
    throw UnimplementedError();
  }
  
  @override
  update() {
    // TODO: implement update
    throw UnimplementedError();
  }
  
}
