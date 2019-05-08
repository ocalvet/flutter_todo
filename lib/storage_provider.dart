import 'package:localstorage/localstorage.dart';

class StorageProvider {
  final LocalStorage _storage = LocalStorage('flutter_todos');

  Map<String, dynamic> getAll(String key) {
    return _storage.getItem(key);
  }
}
