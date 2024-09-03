abstract class LocalDataProvider {
  Future<void> write({required String key, required String value});

  Future<String?> read(String key);

  Future<void> delete(String key);

  Future<void> deleteAll();

  Future<bool> contains(String key);
}

class LocalDataProviderImpl implements LocalDataProvider{
  @override
  Future<bool> contains(String key) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String key) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() {
    throw UnimplementedError();
  }

  @override
  Future<String?> read(String key) {
    throw UnimplementedError();
  }

  @override
  Future<void> write({required String key, required String value}) {
    throw UnimplementedError();
  }

}