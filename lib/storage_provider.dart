import 'dart:async';

import 'package:localstorage/localstorage.dart';

class StorageProvider {
  final LocalStorage _storage = LocalStorage('flutter_todos');

  Future<Map<String, dynamic>> getAll(String key) async {
    await _storage.ready;
    return _storage.getItem(key);
  }

  Future<void> save(String key, Map<String, dynamic> value) async {
    await _storage.ready;
    _storage.setItem(key, value);
  }
}
