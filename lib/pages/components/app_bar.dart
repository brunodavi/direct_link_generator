import 'package:direct_link_generator/services/interfaces/browser_service_base.dart';
import 'package:flutter/material.dart';

AppBar appBar(BrowserServiceBase browser) => AppBar(
      title: const Text("Direct Link Generator"),
      leading: InkWell(
        onTap: () {
          browser.openUrl("https://github.com/brunodavi/direct_link_generator");
        },
        child: const Icon(
          Icons.code,
          size: 32,
        ),
      ),
      centerTitle: true,
    );
