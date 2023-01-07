// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class BestSeller extends Equatable{
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
        picture: json["picture"],
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

  List<Object?> get props => [id,isFavorites,title,priceWithoutDiscount,discountPrice,picture];
}
