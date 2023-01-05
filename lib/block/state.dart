// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:effective/model/filter_params.dart';
import 'package:equatable/equatable.dart';

import 'package:effective/model/category.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class StartState extends HomeState {
  const StartState();

  @override
  List<Object> get props => [];
}

class SelectCategoryState extends HomeState {
  const SelectCategoryState(this.listCategory);
  final List<Category> listCategory;
  @override
  List<Object> get props => [listCategory];
}

class SetCategoryState extends HomeState {
  const SetCategoryState();
  @override
  List<Object> get props => [];
}

class SelectCityState extends HomeState {
  final String city;
  const SelectCityState({
    required this.city,
  });

  @override
  List<Object> get props => [city];
}

class FilterState extends HomeState {
  const FilterState(this.value);
  final FilterParams value;

  @override
  List<Object> get props => [value];
}

class CancelFilterState extends HomeState {
  const CancelFilterState();

  @override
  List<Object> get props => [];
}
