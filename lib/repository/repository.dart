import 'package:effective/model/category.dart';
import 'package:effective/model/filter_params.dart';
import 'package:flutter/src/widgets/framework.dart';

abstract class Repository {
  List<Category> listCategory = [];

  String city = '';
  List<String> listCity = [];
  FilterParams filterParams = FilterParams();

  Future<void> setListCategory();
  Future<void> setListCity();
  Future<void> setListPrices();
  Future<void> setListBrand();
  Future<void> setListSizes();
  void selectCategory(Category category) {
    listCategory.forEach((element) {
      element.selected = false;
    });
    category.selected = true;
  }

  Future<String> selectCity(BuildContext context);
  
  void setBrend(String? brend) {
    filterParams.brand = brend;
  }

  void setPrice(String? value) {
    filterParams.price = value;
  }
  void setSize(String? value) {
    filterParams.size = value;
  }
}
