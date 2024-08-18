import 'package:bookly/features/home/domain/entities/book_entity.dart';

import 'AccessInfo.dart';
import 'VolumeInfo.dart';
import 'SaleInfo.dart';
import 'SearchInfo.dart';

class BookModel extends BookEntity {
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
            bookId: id,
            image: volumeInfo!.imageLinks?.thumbnail,
            authorName: volumeInfo.authors!.first,
            price: 0,
            rating: volumeInfo.averageRating,
            title: volumeInfo.title);

  factory BookModel.fromJson(dynamic json) {
    return BookModel(
        kind: json['kind'],
        id: json['id'],
        etag: json['etag'],
        saleInfo: json['saleInfo'] != null
            ? SaleInfo.fromJson(json['saleInfo'])
            : null,
        volumeInfo: json['volumeInfo'] != null
            ? VolumeInfo.fromJson(json['volumeInfo'])
            : null,
        accessInfo: json['accessInfo'] != null
            ? AccessInfo.fromJson(json['accessInfo'])
            : null,
        searchInfo: json['searchInfo'] != null
            ? SearchInfo.fromJson(json['searchInfo'])
            : null,
        selfLink: json['selfLink']);
  }
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    if (volumeInfo != null) {
      map['volumeInfo'] = volumeInfo?.toJson();
    }
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo?.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo?.toJson();
    }
    if (searchInfo != null) {
      map['searchInfo'] = searchInfo?.toJson();
    }
    return map;
  }
}
