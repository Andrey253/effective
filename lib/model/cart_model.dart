// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

CartModel? cartModelFromJson(String str) =>
    CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel? data) => json.encode(data!.toJson());

class CartModel {
  CartModel({
    required this.basket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  final List<Basket?>? basket;
  final String? delivery;
  final String? id;
  final int? total;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        basket: json["basket"] == null
            ? []
            : List<Basket?>.from(
                json["basket"]!.map((x) => Basket.fromJson(x))),
        delivery: json["delivery"],
        id: json["id"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "basket": basket == null
            ? []
            : List<dynamic>.from(basket!.map((x) => x!.toJson())),
        "delivery": delivery,
        "id": id,
        "total": total,
      };
}

class Basket {
  Basket({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
    required this.quantity,
  });

  final int id;
  final int quantity;
  final String images;
  final int price;
  final String title;

  factory Basket.fromJson(Map<String, dynamic> json) => Basket(
        id: json["id"],
        images: json["images"],
        price: json["price"],
        title: json["title"],
        quantity: json["quantity"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": images,
        "price": price,
        "title": title,
        "quantity": quantity,
      };

  Basket copyWith({
    int? id,
    String? images,
    int? price,
    String? title,
    int? quantity,
  }) {
    return Basket(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      price: price ?? this.price,
      title: title ?? this.title,
    );
  }
}
