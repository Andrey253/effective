class FilterParams {
  List<String> listBrands = [];
  List<String> listPrices = [];
  List<String> listSizes = [];
  String? brand;
  String? price;
  String? size;
  FilterParams();

  @override
  bool operator ==(covariant FilterParams other) {
    if (identical(this, other)) return true;
  
    return 
      other.brand == brand &&
      other.price == price &&
      other.size == size;
  }

  @override
  int get hashCode {
    return listBrands.hashCode ^
      listPrices.hashCode ^
      listSizes.hashCode ^
      brand.hashCode ^
      price.hashCode ^
      size.hashCode;
  }
}
