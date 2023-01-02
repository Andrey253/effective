List<Category> listCategory = [
  Category(name: 'Phone', asset: 'assets/svg/phone.svg', selected: true),
  Category(name: 'Computer', asset: 'assets/svg/computer.svg', selected: false),
  Category(name: 'Health', asset: 'assets/svg/health.svg', selected: false),
  Category(name: 'Books', asset: 'assets/svg/books.svg', selected: false),
  Category(name: 'Web', asset: 'assets/svg/web.svg', selected: false),
  Category(name: 'Earphones', asset: 'assets/svg/earphones.svg', selected: false),
];


class Category {
  String name;
  String asset;
  bool selected;
  Category({
    required this.name,
    required this.asset,
    required this.selected,
  });
}
