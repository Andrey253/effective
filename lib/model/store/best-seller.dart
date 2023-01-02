class BestSeller {
    BestSeller({
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
}

