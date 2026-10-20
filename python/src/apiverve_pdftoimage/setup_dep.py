from setuptools import setup, find_packages

setup(
    name='apiverve_pdftoimage',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='PDF to Image renders the pages you choose from a PDF, uploaded or fetched from a URL, as PNG or JPG images and returns a download link for each, valid for 2 days, with its pixel size. The Free plan renders one page per call at 150 dpi; paid plans render up to 10 pages per call and can set the resolution from 72 to 300 dpi.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/pdftoimage?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
