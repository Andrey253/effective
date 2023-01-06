import 'package:effective/model/details_model.dart';
import 'package:effective/model/product_model.dart';
import 'package:equatable/equatable.dart';



abstract class CartState extends Equatable {
  const CartState();
}

class InitCartState extends CartState {
  const InitCartState();
  // final String url;

  @override
  List<Object> get props => [];
}
