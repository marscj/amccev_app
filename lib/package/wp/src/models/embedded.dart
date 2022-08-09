import 'dart:convert';

class Embedded {
  int? id;
  MediaDetails? medium;
  MediaDetails? thumbnail;
  MediaDetails? etBuilderPostMainImage;
  MediaDetails? etBuilderPortfolioImage;
  MediaDetails? etBuilderGalleryImagePortrait;
  MediaDetails? extraImageMedium;
  MediaDetails? extraImageSmall;
  MediaDetails? extraImageSquareMedium;
  MediaDetails? extraImageSquareSmall;
  MediaDetails? full;
  String? sourceUrl;

  Embedded(
      {this.id,
      this.medium,
      this.thumbnail,
      this.etBuilderPostMainImage,
      this.etBuilderPortfolioImage,
      this.etBuilderGalleryImagePortrait,
      this.extraImageMedium,
      this.extraImageSmall,
      this.extraImageSquareMedium,
      this.extraImageSquareSmall,
      this.full,
      this.sourceUrl});

  factory Embedded.fromMap(Map<String, dynamic> json) {
    return Embedded(
        id: json['id'],
        medium: json['media_details']['sizes']['medium'] != null
            ? MediaDetails?.fromJson(json['media_details']['sizes']['medium'])
            : null,
        thumbnail: json['media_details']['sizes']['thumbnail'] != null
            ? MediaDetails?.fromJson(
                json['media_details']['sizes']['thumbnail'])
            : null,
        etBuilderPostMainImage: json['media_details']['sizes']['et-builder-post-main-image'] != null
            ? MediaDetails?.fromJson(
                json['media_details']['sizes']['et-builder-post-main-image'])
            : null,
        etBuilderPortfolioImage: json['media_details']['sizes']['et-builder-portfolio-image'] != null
            ? MediaDetails?.fromJson(
                json['media_details']['sizes']['et-builder-portfolio-image'])
            : null,
        etBuilderGalleryImagePortrait: json['media_details']['sizes']['et-builder-gallery-image-portrait'] != null
            ? MediaDetails?.fromJson(json['media_details']['sizes']
                ['et-builder-gallery-image-portrait'])
            : null,
        extraImageMedium: json['media_details']['sizes']['extra-image-medium'] != null
            ? MediaDetails?.fromJson(
                json['media_details']['sizes']['extra-image-medium'])
            : null,
        extraImageSmall: json['media_details']['sizes']['extra-image-small'] != null
            ? MediaDetails?.fromJson(json['media_details']['sizes']['extra-image-small'])
            : null,
        extraImageSquareMedium: json['media_details']['sizes']['extra-image-square-medium'] != null ? MediaDetails?.fromJson(json['media_details']['sizes']['extra-image-square-medium']) : null,
        extraImageSquareSmall: json['media_details']['sizes']['extra-image-square-small'] != null ? MediaDetails?.fromJson(json['media_details']['sizes']['extra-image-square-small']) : null,
        full: json['media_details']['sizes']['full'] != null ? MediaDetails?.fromJson(json['media_details']['sizes']['full']) : null,
        sourceUrl: json['source_url']);
  }

  String toJson() => json.encode(toMap());

  factory Embedded.fromJson(String source) =>
      Embedded.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (medium != null) {
      data['medium'] = medium?.toJson();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail?.toJson();
    }
    if (etBuilderPostMainImage != null) {
      data['et-builder-post-main-image'] = etBuilderPostMainImage?.toJson();
    }
    if (etBuilderPortfolioImage != null) {
      data['et-builder-portfolio-image'] = etBuilderPortfolioImage?.toJson();
    }
    if (etBuilderGalleryImagePortrait != null) {
      data['et-builder-gallery-image-portrait'] =
          etBuilderGalleryImagePortrait?.toJson();
    }
    if (extraImageMedium != null) {
      data['extra-image-medium'] = extraImageMedium?.toJson();
    }
    if (extraImageSmall != null) {
      data['extra-image-small'] = extraImageSmall?.toJson();
    }
    if (extraImageSquareMedium != null) {
      data['extra-image-square-medium'] = extraImageSquareMedium?.toJson();
    }
    if (extraImageSquareSmall != null) {
      data['extra-image-square-small'] = extraImageSquareSmall?.toJson();
    }
    if (full != null) {
      data['full'] = full?.toJson();
    }
    data['source_url'] = sourceUrl;
    return data;
  }
}

class MediaDetails {
  String? file;
  int? width;
  int? height;
  String? mimeType;
  String? sourceUrl;

  MediaDetails(
      {this.file, this.width, this.height, this.mimeType, this.sourceUrl});

  MediaDetails.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['file'] = file;
    data['width'] = width;
    data['height'] = height;
    data['mime_type'] = mimeType;
    data['source_url'] = sourceUrl;
    return data;
  }
}
