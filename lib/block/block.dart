import 'package:effective/block/state.dart';
import 'package:effective/help/showsearch_city.dart';
import 'package:effective/model/category.dart';
import 'package:effective/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc(this.repository) : super(const StartState()) {
    init();
  }

  void init() async {
    getListCity();
    getListCategory();
  }

  final Repository repository;

  void selectCity(BuildContext context) async {
    final city = await showSearch(
        context: context, delegate: SearchCity(listCity: repository.listCity));
    repository.city = city;
    emit(SelectCityState(city: city));
  }

  void selectCategory(Category category) {
    repository.listCategory.forEach((element) {
      element.selected = false;
    });
    category.selected = true;
    print('teg selectCategory');
    emit(SelectCategoryState(category));
  }

  void getListCategory() async {
    repository.listCategory = await listCategoryStart();
    emit(const SetCategoryState());
  }

  void getListCity() async {
    if (repository.listCity.isNotEmpty) return;
    repository.listCity = await listCityStart();
    if (repository.listCity.isNotEmpty) {
      repository.city = repository.listCity.first;
    }
    emit(SelectCityState(city: repository.city));
  }

  filter() {
    emit(const FilterState());
  }

  void cancelFilter() {
    emit(const CancelFilterState());
  }

  void doneFilter() {
    emit(const CancelFilterState());
  }
}
