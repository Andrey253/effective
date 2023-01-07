import 'package:effective/model/category.dart';
import 'package:effective/model/details_model.dart';
import 'package:effective/model/filter_params.dart';
import 'package:effective/model/product_model.dart';
import 'package:effective/model/store/store.dart';
import 'package:flutter/src/widgets/framework.dart';

abstract class Repository {
  List<Category> listCategory = [];

  String city = '';
  List<String> listCity = [];
  FilterParams filterParams = FilterParams(
      listBrands: [],
      listPrices: [],
      listSizes: [],
      brand: '',
      price: '',
      size: '');

  late Details details;
  late Product product;
  List<Product> cart = [];

  String get weightCart => cart
      .fold(0, (previousValue, element) => previousValue + element.quantity)
      .toString();

  Future<void> setListCategory();
  Future<void> setListCity();
  Future<void> setListPrices();
  Future<void> setListBrand();
  Future<void> setListSizes();
  Future<Store?> getStore();
  Store store = Store(homeStore: [], bestSeller: []);
  void selectCategory(Category category) {
    listCategory = List.from(listCategory.map((e) => Category(
        name: e.name, asset: e.asset, selected: category.name == e.name)));
  }

  Future<String> selectCity(BuildContext context);

  void setBrend(String? value) {
    filterParams = filterParams.copyWith(brand: value);
  }

  void setPrice(String? value) {
    filterParams = filterParams.copyWith(price: value);
  }

  void setSize(String? value) {
    filterParams = filterParams.copyWith(size: value);
  }

  void decrement(int index) {
    final deletedProduct = cart.removeAt(index);
    if (deletedProduct.quantity == 1) {
      return;
    }
    final product =
        deletedProduct.copyWith(quantity: deletedProduct.quantity - 1);
    cart.insert(index, product);
  }

  void increment(int index) {
    final deletedProduct = cart.removeAt(index);
    final product =
        deletedProduct.copyWith(quantity: deletedProduct.quantity + 1);
    cart.insert(index, product);
  }

  void remove(int index) {
    cart.removeAt(index);
  }
}
