interface class ClipboardServiceBase {
  Future<void> set(String url) async {}
  Future<String?> get() async => throw UnimplementedError();
}
