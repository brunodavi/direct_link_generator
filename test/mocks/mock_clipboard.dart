import 'package:flutter/services.dart';

class MockClipboard {
  dynamic clipboardData = <String, dynamic>{'text': null};

  Future<Object?> handleMethodCall(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'Clipboard.getData':
        return clipboardData;
      case 'Clipboard.setData':
        clipboardData = methodCall.arguments;
        return null;
      default:
        return null;
    }
  }
}
