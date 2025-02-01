import 'package:direct_link_generator/core/providers/interfaces/provider_base.dart';

import 'providers/google_drive_provider.dart';

final providers = <ProviderBase>[
  GoogleDriveProvider(),
];

String? generateLink(String link) {
  for (var provider in providers) {
    final linkGenerated = provider.generate(link);
    if (linkGenerated != null) return linkGenerated;
  }

  return null;
}
