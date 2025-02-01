import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

AppBar appBar() => AppBar(
      title: const Text("Direct Link Generator"),
      leading: InkWell(
        onTap: () {
          html.window.open(
            "https://github.com/brunodavi/direct_link_generator",
            "source code",
          );
        },
        child: const Icon(
          Icons.code,
          size: 32,
        ),
      ),
      centerTitle: true,
    );
