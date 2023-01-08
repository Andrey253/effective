// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class BestSeller extends Equatable {
  const BestSeller({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  final int id;
  final bool isFavorites;
  final String title;
  final int priceWithoutDiscount;
  final int discountPrice;
  final String picture;

  factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
        id: json["id"],
        isFavorites: json["is_favorites"],
        title: json["title"],
        priceWithoutDiscount: json["price_without_discount"],
        discountPrice: json["discount_price"],
        picture: fix_502BadGateway(json["picture"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_favorites": isFavorites,
        "title": title,
        "price_without_discount": priceWithoutDiscount,
        "discount_price": discountPrice,
        "picture": picture,
      };

  @override
  bool operator ==(covariant BestSeller other) {
    return other.id == id && other.picture == picture;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        isFavorites.hashCode ^
        title.hashCode ^
        priceWithoutDiscount.hashCode ^
        discountPrice.hashCode ^
        picture.hashCode;
  }

  @override
  List<Object?> get props => [id, isFavorites, title, priceWithoutDiscount, discountPrice, picture];
}


dynamic fix_502BadGateway(dynamic url) {
  if (url == urlError1) {
    return urlReplace1;
  }
  return url;
}
// Сервер стал отвечать на этот url "502 Bad Gateway", сделал подмену
const urlError1 =
    "https://opt-1739925.ssl.1c-bitrix-cdn.ru/upload/iblock/c01/c014d088c28d45b606ed8c58e5817172.jpg?160405904823488";
const urlReplace1 = 'https://www.cactus.md/i.ashx?i=/i/products/21/107355.jpg&w=680&h=500';
