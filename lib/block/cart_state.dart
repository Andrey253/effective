import 'package:effective/model/cart/basket_model.dart';
import 'package:effective/model/cart/cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:effective/model/product_model.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class InitCartState extends CartState {
  const InitCartState();


  @override
  List<Object> get props => [];
}
class UpdateCartState extends CartState {

   final List<Basket> cart;
  const UpdateCartState({
    required this.cart,
  });

  @override
  List<Object> get props => [cart];
}
