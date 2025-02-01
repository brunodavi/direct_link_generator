import 'interfaces/provider_base.dart';

class GoogleDriveProvider implements ProviderBase {

  @override
  String? generate(String link) {
    final regex = RegExp('^https://drive.google.com/file/d/(.+)/.+');
    final match = regex.firstMatch(link);

    if (match == null) return null;

    final id = match[1];

    final directLink = 'https://drive.usercontent.google.com/download?id=$id';

    return directLink;
  }
}
