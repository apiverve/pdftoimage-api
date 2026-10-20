"""
PDF to Image API - Basic Usage Example

This example demonstrates the basic usage of the PDF to Image API.
API Documentation: https://docs.apiverve.com/ref/pdftoimage
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/pdftoimage'

def call_pdftoimage_api():
    """
    Make a POST request to the PDF to Image API
    """
    try:
        # Request body
        request_body &#x3D; {
    &#x27;pdf&#x27;: &#x27;https://raw.githubusercontent.com/mozilla/pdf.js/master/web/compressed.tracemonkey-pldi-09.pdf&#x27;,
    &#x27;pages&#x27;: &#x27;1-2&#x27;,
    &#x27;format&#x27;: &#x27;png&#x27;
}

        headers = {
            'x-api-key': API_KEY,
            'Content-Type': 'application/json'
        }

        response = requests.post(API_URL, headers=headers, json=request_body)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling PDF to Image API...\n')

    result = call_pdftoimage_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')
