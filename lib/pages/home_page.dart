import 'package:flutter/material.dart';

import '/core/generate_link.dart';
import '/services/interfaces/browser_service_base.dart';
import '/services/interfaces/clipboard_service_base.dart';

import 'components/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.browser, required this.clipboard});

  final BrowserServiceBase browser;
  final ClipboardServiceBase clipboard;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _linkGeneratorController = TextEditingController();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.browser),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  errorText: _errorText,
                  label: const Text("Shared Link"),
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

  Future<void> copyLink() async {
    var link = _linkGeneratorController.text;
    var linkGenerated = generateLink(link);

    if (linkGenerated == null) {
      setState(() {
        _errorText = "Error: Invalid link!";
      });
      return;
    }

    setState(() {
      _errorText = null;
    });

    await widget.clipboard.set(linkGenerated);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Direct link copied for clipboard!"),
        backgroundColor: Colors.green,
      ),
    );
  }
}
