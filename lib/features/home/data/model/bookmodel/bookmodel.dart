import 'package:bookly2/features/home/domain/entities/booksentity.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'volume_info.dart';

class Bookmodel extends booksentity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;

  Bookmodel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
  }) : super(
            bookid: id ?? "",
            image: volumeInfo?.imageLinks?.smallThumbnail ?? "",
            title: volumeInfo?.title ?? "",
            author: volumeInfo?.authors?.first ?? "",
            rating: 0.0,
            price: 0.0,
            link: accessInfo?.webReaderLink);

  factory Bookmodel.fromJson(Map<String, dynamic> json) => Bookmodel(
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
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo?.toJson(),
        'saleInfo': saleInfo?.toJson(),
        'accessInfo': accessInfo?.toJson(),
      };
}
