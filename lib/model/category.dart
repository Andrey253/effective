// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

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

    return other.name == name &&
        other.asset == asset &&
        other.selected == selected;
  }

  @override
  int get hashCode => name.hashCode ^ asset.hashCode ^ selected.hashCode;
}
