/// Response models for the PDF to Image API.

/// API Response wrapper.
class PdftoimageResponse {
  final String status;
  final dynamic error;
  final PdftoimageData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  PdftoimageResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory PdftoimageResponse.fromJson(Map<String, dynamic> json) => PdftoimageResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? PdftoimageData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the PDF to Image API.

class PdftoimageData {
  num? pageCount;
  String? format;
  num? dpi;
  num? imageCount;
  num? expires;
  List<PdftoimageDataImagesItem>? images;

  PdftoimageData({
    this.pageCount,
    this.format,
    this.dpi,
    this.imageCount,
    this.expires,
    this.images,
  });

  factory PdftoimageData.fromJson(Map<String, dynamic> json) => PdftoimageData(
      pageCount: json['pageCount'],
      format: json['format'],
      dpi: json['dpi'],
      imageCount: json['imageCount'],
      expires: json['expires'],
      images: (json['images'] as List?)?.map((e) => PdftoimageDataImagesItem.fromJson(e)).toList(),
    );
}

class PdftoimageDataImagesItem {
  num? page;
  String? imageName;
  num? width;
  num? height;
  num? dpi;
  num? size;
  String? downloadURL;

  PdftoimageDataImagesItem({
    this.page,
    this.imageName,
    this.width,
    this.height,
    this.dpi,
    this.size,
    this.downloadURL,
  });

  factory PdftoimageDataImagesItem.fromJson(Map<String, dynamic> json) => PdftoimageDataImagesItem(
      page: json['page'],
      imageName: json['imageName'],
      width: json['width'],
      height: json['height'],
      dpi: json['dpi'],
      size: json['size'],
      downloadURL: json['downloadURL'],
    );
}

class PdftoimageRequest {
  String? pdf;
  String? pages;
  String? format;

  PdftoimageRequest({
    this.pdf,
    this.pages,
    this.format,
  });

  Map<String, dynamic> toJson() => {
      if (pdf != null) 'pdf': pdf,
      if (pages != null) 'pages': pages,
      if (format != null) 'format': format,
    };
}
