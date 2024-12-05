import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

class BookModel extends BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
            bookPreviewLink: volumeInfo!.previewLink,
            bookId: id!,
            image: volumeInfo.imageLinks?.thumbnail ?? '',
            authorName: lengthadjustment(volumeInfo.authors?.first),
            price: 0.0,
            rating: volumeInfo.averageRating,
            title: volumeInfo.title!,
            ratingCount: volumeInfo.ratingsCount);

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        kind: json['kind'] as String?,
        id: json['id'] as String?,
        etag: json['etag'] as String?,
        selfLink: json['selfLink'] as String?,
        volumeInfo: json['volumeInfo'] == null
            ? null
            : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
        saleInfo: json['saleInfo'] == null
            ? null
            : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
        accessInfo: json['accessInfo'] == null
            ? null
            : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
        searchInfo: json['searchInfo'] == null
            ? null
            : SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo?.toJson(),
        'saleInfo': saleInfo?.toJson(),
        'accessInfo': accessInfo?.toJson(),
        'searchInfo': searchInfo?.toJson(),
      };
}

String lengthadjustment(String? text) {
  String nullCase = "No author found";
  if (text == null) {
    return nullCase;
  }
  if (text.length > 40) {
    text = text.substring(0, 40);
    return text;
  } else {
    return text;
  }
}
