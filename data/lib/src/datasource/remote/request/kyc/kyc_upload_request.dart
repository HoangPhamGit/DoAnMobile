part of swagger.api;

class KycUploadRequest {
  String? imageType;

  ImageData imageData;
  KycUploadRequest({required this.imageType, required this.imageData});

  Map<String, dynamic> toJson() {
    return {
      'p_image_type': imageType,
      'p_image_data': imageData.toJson(),
    };
  }
}

class ImageData {
  String? fileName;
  String? mimeType;
  String? base64;
  ImageData({
    required this.fileName,
    this.mimeType = "image/png",
    this.base64 = "base64",
  });

  Map<String, dynamic> toJson() {
    return {
      'filename': fileName,
      'mimetype': mimeType,
      'base64': base64,
    };
  }
}
