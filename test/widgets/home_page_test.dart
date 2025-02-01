import 'package:direct_link_generator/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_browser_service.dart';
import '../mocks/mock_clipboard_service.dart';

void main() {
  late MockClipboardService mockClipboard;
  late MockBrowserService mockBrowser;
  late HomePage homePage;

  setUp(() {
    mockClipboard = MockClipboardService();
    mockBrowser = MockBrowserService();
    homePage = HomePage(browser: mockBrowser, clipboard: mockClipboard);
  });

  testWidgets('Should show error on generate invalid links', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: homePage));

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
    await tester.pumpWidget(MaterialApp(home: homePage));

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

    final urlGenerated = await mockClipboard.get();

    expect(
      urlGenerated,
      "https://drive.usercontent.google.com/download?id=EXEMPLO",
    );
  });

  testWidgets('Should open url to github project', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: homePage));

    final iconClickable = find.byIcon(Icons.code);
    await tester.tap(iconClickable);
    await tester.pumpAndSettle();

    expect(
      mockBrowser.urlOpened,
      "https://github.com/brunodavi/direct_link_generator",
    );
  });
}
