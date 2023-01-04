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
    setListCity();
    setListCategory();
    setFilterParams();
  }

  final Repository repository;

  void selectCity(BuildContext context) async {
    final city = await repository.selectCity(context);
    emit(SelectCityState(city: city));
  }

  void selectCategory(Category category) {
    repository.selectCategory(category);
    emit(SelectCategoryState(category));
  }

  void setListCategory() async {
    await repository.setListCategory();
    emit(const SetCategoryState());
  }

  void setListCity() async {
    await repository.setListCity();
    emit(SelectCityState(city: repository.city));
  }

  filter(String v) {
    emit(FilterState(v));
  }

  void cancelFilter() {
    emit(const CancelFilterState());
  }

  void doneFilter() {
    emit(const CancelFilterState());
  }

  void setFilterParams() async {
    await repository.setListPrices();
    await repository.setListBrand();
    await repository.setListSizes();
    emit(const StartState());
  }

  void setBrend(String? value) {
    repository.setBrend(value);
    if (value != null) {
      emit(FilterState(value));
    }
  }

  void setPrice(String? value) {
        repository.setPrice(value);
    if (value != null) {
      emit(FilterState(value));
    }
  }

  void setSize(String? value) {
            repository.setSize(value);
    if (value != null) {
      emit(FilterState(value));
    }
  }
}
