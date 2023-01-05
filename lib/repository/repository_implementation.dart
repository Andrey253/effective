// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:effective/help/showsearch_city.dart';
import 'package:effective/model/json_store.dart';
import 'package:effective/model/category.dart';
import 'package:effective/model/store/store.dart';
import 'package:effective/repository/repository.dart';
import 'package:flutter/material.dart';

class RepositoryImplementation extends Repository {
  @override
  Future<void> setListCategory() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    listCategory =const [
      Category(name: 'Phone', asset: 'assets/svg/phone.svg', selected: true),
      Category(
          name: 'Computer', asset: 'assets/svg/computer.svg', selected: false),
      Category(name: 'Health', asset: 'assets/svg/health.svg', selected: false),
      Category(name: 'Books', asset: 'assets/svg/books.svg', selected: false),
      Category(name: 'Web', asset: 'assets/svg/web.svg', selected: false),
      Category(
          name: 'Earphones',
          asset: 'assets/svg/earphones.svg',
          selected: false),
    ];
  }

  @override
  Future<void> setListCity() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    listCity = ['Moskow', 'Tomsk', 'Novosibirsk'];
    if (listCity.isNotEmpty) {
      city = listCity.first;
    }
  }

  @override
  Future<String> selectCity(BuildContext context) async {
    city = await showSearch(
        context: context, delegate: SearchCity(listCity: listCity));
    return city;
  }

  @override
  Future<void> setListBrand() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final listB = ['Samsung', 'Huawei', 'Poco', 'Xiaomi', 'Realme'];
    filterParams = filterParams.copyWith(listBrands: listB, brand: listB.first);
  }

  @override
  Future<void> setListPrices() async {
    await Future.delayed(const Duration(milliseconds: 900));
    final listP = [
      '\$0 - \$300',
      '\$300 - \$500',
      '\$500 - \$1000',
      '\$1000 - \$3000',
      '\$3000 - \$6000',
      '\$6000 - \$10000',
    ];
    filterParams = filterParams.copyWith(listPrices: listP, price: listP.first);
  }

  @override
  Future<void> setListSizes() async {
    await Future.delayed(const Duration(milliseconds: 800));
    final listS = [
      '4.5 to 5.5 inches',
      '5.5 to 6.5 inches',
      '6.5 to 7.5 inches',
      '7.5 more inches',
    ];
    filterParams = filterParams.copyWith(listSizes: listS, size: listS.first);
  }

  @override
  Future<Store?> getStore() async {
    await Future.delayed(const Duration(milliseconds: 700));
    store = Store.fromJson(jsonStore);
    return store;
  }
}
