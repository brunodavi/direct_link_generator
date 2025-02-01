# Direct Link Generator

This project is a web page built using Flutter that allows users to generate direct download links from Google Drive. The project is designed to be easily extendable to support additional cloud storage providers.

## Features

- Generate direct download links from Google Drive
- Easily extendable to support other cloud storage providers
- User-friendly web interface
- Built with Flutter for cross-platform compatibility

## Project Structure

```
lib/
├── core/
│   ├── providers/
│   │   ├── interfaces/
│   │   │   └── provider_base.dart
│   │   └── google_drive_provider.dart
│   └── generate_link.dart
├── pages/
│   ├── components/
│   │   └── app_bar.dart
│   └── home_page.dart
└── main.dart
```

- `core/`: Contains the core functionality of the application.
  - `providers/`: Contains the provider implementations and interfaces.
    - `interfaces/`: Contains the base interface for providers.
      - `provider_base.dart`: Base interface for providers.
    - `google_drive_provider.dart`: Implementation for Google Drive provider.
  - `generate_link.dart`: Core logic to generate direct links.

- `pages/`: Contains the UI components and pages.
  - `components/`: Contains reusable UI components.
    - `app_bar.dart`: Custom app bar component.
  - `home_page.dart`: The main home page of the application.

- `main.dart`: Entry point of the application.

## Getting Started

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/brunodavi/direct-link-generator.git
    cd direct-link-generator
    ```

2. Install dependencies:
    ```sh
    flutter pub get
    ```

3. Run the project:
    ```sh
    flutter run -d chrome
    ```

## Usage

1. Open the web page in your browser.
2. Paste the Google Drive file link in the input field.
3. Click the "Generate" button.
4. The direct download link will be displayed and can be copied to the clipboard.

## Extending to Other Providers

To add support for additional cloud storage providers, follow these steps:

1. Create a new Dart file for the provider in the `lib/core/providers` directory, similar to `google_drive_provider.dart`.
2. Implement the logic to generate direct download links for the provider.

    Example:
    ```dart
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
    ```

3. Add the new provider to the provider list in `generate_link.dart`:

    ```dart
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
    ```
   
4. Update the UI to include an option for the new provider if necessary.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you have any improvements or new features to add.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
