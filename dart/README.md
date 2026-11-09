# PDF to Image API - Dart/Flutter Client

PDF to Image renders the pages you choose from a PDF, uploaded or fetched from a URL, as PNG or JPG images and returns a download link for each, valid for 2 days, with its pixel size. The Free plan renders one page per call at 150 dpi; paid plans render up to 10 pages per call and can set the resolution from 72 to 300 dpi.

[![pub package](https://img.shields.io/pub/v/apiverve_pdftoimage.svg)](https://pub.dev/packages/apiverve_pdftoimage)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [PDF to Image API](https://apiverve.com/marketplace/pdftoimage?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_pdftoimage: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_pdftoimage/apiverve_pdftoimage.dart';

void main() async {
  final client = PdftoimageClient('YOUR_API_KEY');

  try {
    // This API requires a file upload — a JSON body is rejected with a 400.
    final response = await client.executeWithFile('/path/to/your-file');

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "pageCount": 14,
    "format": "png",
    "dpi": 150,
    "imageCount": 2,
    "expires": 1792400000000,
    "images": [
      {
        "page": 1,
        "imageName": "3b7e9d21-4c5a-4f80-a1d6-9e2c8b7f5a34-1.png",
        "width": 1275,
        "height": 1650,
        "dpi": 150,
        "size": 214533,
        "downloadURL": "https://storage.googleapis.com/apiverve/APIData/pdftoimage/3b7e9d21-4c5a-4f80-a1d6-9e2c8b7f5a34-1.png?GoogleAccessId=635500398038-compute%40developer.gserviceaccount.com&Expires=1792400000&Signature=SAMPLE"
      },
      {
        "page": 2,
        "imageName": "3b7e9d21-4c5a-4f80-a1d6-9e2c8b7f5a34-2.png",
        "width": 1275,
        "height": 1650,
        "dpi": 150,
        "size": 198207,
        "downloadURL": "https://storage.googleapis.com/apiverve/APIData/pdftoimage/3b7e9d21-4c5a-4f80-a1d6-9e2c8b7f5a34-2.png?GoogleAccessId=635500398038-compute%40developer.gserviceaccount.com&Expires=1792400000&Signature=SAMPLE"
      }
    ]
  }
}
```

## API Reference

- **API Home:** [PDF to Image API](https://apiverve.com/marketplace/pdftoimage?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/pdftoimage](https://docs.apiverve.com/ref/pdftoimage?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
