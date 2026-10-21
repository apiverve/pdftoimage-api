# PDF to Image API - PHP Package

PDF to Image renders the pages you choose from a PDF, uploaded or fetched from a URL, as PNG or JPG images and returns a download link for each, valid for 2 days, with its pixel size. The Free plan renders one page per call at 150 dpi; paid plans render up to 10 pages per call and can set the resolution from 72 to 300 dpi.

## Installation

Install via Composer:

```bash
composer require apiverve/pdftoimage
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Pdftoimage\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'pdf' => 'https://raw.githubusercontent.com/mozilla/pdf.js/master/web/compressed.tracemonkey-pldi-09.pdf',
    'pages' => '1-2',
    'format' => 'png'
]);

// Print the response
print_r($response);
```

### File Upload

```php
// Upload a file
$response = $client->executeWithFile('/path/to/file.jpg');

// Or use a URL
$response = $client->executeWithUrl('https://example.com/image.jpg');
```

### Error Handling

```php
use APIVerve\Pdftoimage\Client;
use APIVerve\Pdftoimage\Exceptions\APIException;
use APIVerve\Pdftoimage\Exceptions\ValidationException;

try {
    $response = $client->execute(['pdf' => 'https://raw.githubusercontent.com/mozilla/pdf.js/master/web/compressed.tracemonkey-pldi-09.pdf', 'pages' => '1-2', 'format' => 'png']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/pdftoimage?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/pdftoimage?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/pdftoimage?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
