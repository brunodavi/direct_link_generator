// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:direct_link_generator/main.dart';

void main() {
  testWidgets('Generate link smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Generate'), findsOneWidget);
    expect(find.text('Shared Link'), findsOneWidget);

    await tester.tap(find.byType(TextButton));
    await tester.pump();

    expect(find.textContaining('Error'), findsOneWidget);
  });
}
