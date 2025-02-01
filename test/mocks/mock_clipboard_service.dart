import 'package:direct_link_generator/services/interfaces/clipboard_service_base.dart';

class MockClipboardService implements ClipboardServiceBase {
  String? _clipboardText;

  @override
  Future<void> set(String text) async { _clipboardText = text; }

  @override
  Future<String?> get() async => _clipboardText;
}
