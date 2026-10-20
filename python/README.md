PDF to Image API
============

PDF to Image renders the pages you choose from a PDF, uploaded or fetched from a URL, as PNG or JPG images and returns a download link for each, valid for 2 days, with its pixel size. The Free plan renders one page per call at 150 dpi; paid plans render up to 10 pages per call and can set the resolution from 72 to 300 dpi.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-pdftoimage.svg)](https://pypi.org/project/apiverve-pdftoimage/)

This is a Python wrapper for the [PDF to Image API](https://apiverve.com/marketplace/pdftoimage?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-pdftoimage
```

Using `pip3`:

```bash
pip3 install apiverve-pdftoimage
```

---

## Configuration

Before using the PDF to Image API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_pdftoimage.apiClient import PdftoimageAPIClient

# Initialize the client with your APIVerve API key
api = PdftoimageAPIClient("[YOUR_API_KEY]")

# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }

try:
    # Make the API call
    result = api.execute_with_file(files)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The PDF to Image API documentation is found here: [https://docs.apiverve.com/ref/pdftoimage](https://docs.apiverve.com/ref/pdftoimage?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_pdftoimage.apiClient import PdftoimageAPIClient

# Initialize the client with your APIVerve API key
api = PdftoimageAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }
```

###### Simple Request

```python
# Make a request to the API
result = api.execute_with_file(files)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `PdftoimageAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_pdftoimage.apiClient import PdftoimageAPIClient, PdftoimageAPIClientError

api = PdftoimageAPIClient("[YOUR_API_KEY]")

# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except PdftoimageAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_pdftoimage.apiClient import PdftoimageAPIClient, PdftoimageAPIClientError

api = PdftoimageAPIClient("[YOUR_API_KEY]")

# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except PdftoimageAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_pdftoimage.apiClient import PdftoimageAPIClient, PdftoimageAPIClientError

# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }

# Using context manager ensures proper cleanup
with PdftoimageAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except PdftoimageAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_pdftoimage.apiClient import PdftoimageAPIClient

# Enable debug mode
api = PdftoimageAPIClient("[YOUR_API_KEY]", debug=True)

# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_pdftoimage.apiClient import PdftoimageAPIClient

api = PdftoimageAPIClient("[YOUR_API_KEY]")

# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
