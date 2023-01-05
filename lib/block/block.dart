import 'package:effective/block/details_state.dart';
import 'package:effective/block/state.dart';
import 'package:effective/help/showsearch_city.dart';
import 'package:effective/model/category.dart';
import 'package:effective/repository/repository.dart';
import 'package:effective/widgets/details/details.dart';
import 'package:effective/widgets/details/detais_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<HomeState> {
  AppBloc(this.repository) : super(const StartState()) {
    init();
  }

  void init() async {
    setListCity();
    setListCategory();
    setFilterParams();
    getStore();
  }

  final Repository repository;

  void selectCity(BuildContext context) async {
    final city = await repository.selectCity(context);
    emit(SelectCityState(city: city));
  }

  void selectCategory(Category category) {
    repository.selectCategory(category);
    emit(SelectCategoryState(repository.listCategory));
  }

  void setListCategory() async {
    await repository.setListCategory();
    emit(const SetCategoryState());
  }

  void setListCity() async {
    await repository.setListCity();
    emit(SelectCityState(city: repository.city));
  }

  void openFilter() {
    emit(state is FilterState
        ? const CancelFilterState()
        : FilterState(repository.filterParams));
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

    emit(FilterState(repository.filterParams));
  }

  void setPrice(String? value) {
    repository.setPrice(value);
    if (value != null) {
      emit(FilterState(repository.filterParams));
    }
  }

  void setSize(String? value) {
    repository.setSize(value);
    if (value != null) {
      emit(FilterState(repository.filterParams));
    }
  }

  void getStore() async {
    await repository.getStore();
    emit(const StartState());
  }

  void navigateToDetails(BuildContext context, String url,Repository repository) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>  DetailsHome(repository: repository,url: url,),
    ));
    // emit(GetingDetails(url: url));
  }
}
