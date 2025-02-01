import 'package:direct_link_generator/services/interfaces/browser_service_base.dart';

class MockBrowserService implements BrowserServiceBase {
  String? urlOpened;

  @override
  void openUrl(String url) {
    urlOpened = url;
  }
}
