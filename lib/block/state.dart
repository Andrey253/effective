// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:effective/model/filter_params.dart';
import 'package:equatable/equatable.dart';

import 'package:effective/model/category.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class StartState extends AppState {
  const StartState();

  @override
  List<Object> get props => [];
}

class SelectCategoryState extends AppState {
  const SelectCategoryState(this.cat);
  final Category cat;
  @override
  List<Object> get props => [cat];
}

class SetCategoryState extends AppState {
  const SetCategoryState();
  @override
  List<Object> get props => [];
}

class SelectCityState extends AppState {
  final String city;
  const SelectCityState({
    required this.city,
  });

  @override
  List<Object> get props => [city];
}

class FilterState extends AppState {
  const FilterState(this.value);
  final String value;

  @override
  List<Object> get props => [value];
}

class CancelFilterState extends AppState {
  const CancelFilterState();

  @override
  List<Object> get props => [];
}
