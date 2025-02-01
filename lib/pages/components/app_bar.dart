import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

AppBar appBar() => AppBar(
      title: const Text("Direct Link Generator"),
      leading: InkWell(
        onTap: () {
          window.open(
            "https://github.com/brunodavi/direct_link_generator",
            "source code",
          );
        },
        child: const Icon(Icons.code),
      ),
      centerTitle: true,
    );
