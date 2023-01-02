class HomeStore {
    HomeStore({
        required this.id,
         this.isNew,
        required this.title,
        required this.subtitle,
        required this.picture,
        required this.isBuy,
    });

    final int id;
    final bool? isNew;
    final String title;
    final String subtitle;
    final String picture;
    final bool isBuy;

    factory HomeStore.fromJson(Map<String, dynamic> json) => HomeStore(
        id: json["id"],
        isNew: json["is_new"] == null ? null : json["is_new"],
        title: json["title"],
        subtitle: json["subtitle"],
        picture: json["picture"],
        isBuy: json["is_buy"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_new": isNew == null ? null : isNew,
        "title": title,
        "subtitle": subtitle,
        "picture": picture,
        "is_buy": isBuy,
    };
}