import 'package:universal_html/html.dart' as html;

import 'interfaces/browser_service_base.dart';

class BrowserService implements BrowserServiceBase {
  @override
  void openUrl(String url) {
    html.window.open(url, "open url");
  }
}
