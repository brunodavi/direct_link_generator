import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/core/generate_link.dart';
import 'components/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _linkGeneratorController =
      TextEditingController();

  void copyLink() {
    var link = _linkGeneratorController.text;

    var linkGenerated = generateLink(link);

    if (linkGenerated == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error: Invalid link!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Clipboard.setData(ClipboardData(text: linkGenerated)).then(
      (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Direct link copied for clipboard!"),
            backgroundColor: Colors.green,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(
                  label: Text("Shared Link"),
                  hintText: "https://drive.google.com/file/d...",
                ),
                autofocus: true,
                controller: _linkGeneratorController,
                onSubmitted: (_) => copyLink(),
              ),
            ),
            TextButton(
              onPressed: copyLink,
              child: const Text("Generate"),
            ),
          ],
        ),
      ),
    );
  }
}
