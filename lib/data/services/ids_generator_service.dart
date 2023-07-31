import 'package:cloud_firestore/cloud_firestore.dart';

class IdGeneratorService {
  static final _store = FirebaseFirestore.instance;
  static Future<String> generateNewId({
    required String collectionName,
  }) async {
    try {
      final collectionRef = await _store.collection(collectionName).get();
      return collectionRef.docs.last.id;
    } catch (_) {
      return '0';
    }
  }
}
