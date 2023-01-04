// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

Future<List<Category>> listCategoryStart() async {
  await Future.delayed(const Duration(milliseconds: 2000));
  return [
  Category(name: 'Phone', asset: 'assets/svg/phone.svg', selected: true),
  Category(name: 'Computer', asset: 'assets/svg/computer.svg', selected: false),
  Category(name: 'Health', asset: 'assets/svg/health.svg', selected: false),
  Category(name: 'Books', asset: 'assets/svg/books.svg', selected: false),
  Category(name: 'Web', asset: 'assets/svg/web.svg', selected: false),
  Category(name: 'Earphones', asset: 'assets/svg/earphones.svg', selected: false),
];
}


class Category {
  String name;
  String asset;
  bool selected;
  Category({
    required this.name,
    required this.asset,
    required this.selected,
  });
  



  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.asset == asset &&
      other.selected == selected;
  }

  @override
  int get hashCode => name.hashCode ^ asset.hashCode ^ selected.hashCode;
  }
