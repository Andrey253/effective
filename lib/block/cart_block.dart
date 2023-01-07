// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:effective/block/cart_state.dart';
import 'package:effective/block/home_block.dart';
import 'package:effective/model/product_model.dart';

class CartBlock extends AppBlock<CartState> {
  CartBlock({required super.repository, required super.type});

  decrement(int index) {
    repository.decrement(index);
    emit(UpdateCartState(cart: List.from(repository.cart)));
  }

  increment(int index) {
    repository.increment(index);
    emit(UpdateCartState(cart: List.from(repository.cart)));
  }

  remove(int index) {
        repository.remove(index);
    emit(UpdateCartState(cart: List.from(repository.cart)));
  }
}
