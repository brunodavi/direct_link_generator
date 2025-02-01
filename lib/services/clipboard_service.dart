import 'package:flutter/services.dart';

import 'interfaces/clipboard_service_base.dart';

class ClipboardService implements ClipboardServiceBase {
  @override
  Future<void> set(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Future<String?> get() async {
    var clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    return clipboardData?.text;
  }
}
