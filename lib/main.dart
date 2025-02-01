import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Direct Link Generator',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
          labelLarge: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blue,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black, fontSize: 16),
          border: OutlineInputBorder(),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              elevation: 4,
              shadowColor: Colors.black),
        ),
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}
