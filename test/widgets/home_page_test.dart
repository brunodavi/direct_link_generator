import 'package:direct_link_generator/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_clipboard.dart';

void main() {
  testWidgets('Should show error on generate invalid links', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    var textField = find.byType(TextField);
    var generateButton = find.text("Generate");

    await tester.enterText(textField, "link-invalido");
    await tester.tap(generateButton);
    await tester.pump();

    expect(find.text("Error: Invalid link!"), findsOneWidget);
  });

  testWidgets('Should copy generated link to clipboard', (
    WidgetTester tester,
  ) async {
    final MockClipboard mockClipboard = MockClipboard();
    TestWidgetsFlutterBinding.ensureInitialized()
        .defaultBinaryMessenger
        .setMockMethodCallHandler(
          SystemChannels.platform,
          mockClipboard.handleMethodCall,
        );

    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    var textField = find.byType(TextField);
    var generateButton = find.text("Generate");

    await tester.enterText(
      textField,
      "https://drive.google.com/file/d/EXEMPLO/view",
    );

    await tester.tap(generateButton);

    await tester.pumpAndSettle();

    expect(find.text("Error: Invalid link!"), findsNothing);
    expect(find.text("Direct link copied for clipboard!"), findsOneWidget);

    final ClipboardData? clipboardData = await Clipboard.getData(
      Clipboard.kTextPlain,
    );

    expect(
      clipboardData?.text,
      "https://drive.usercontent.google.com/download?id=EXEMPLO",
    );
  });
}
