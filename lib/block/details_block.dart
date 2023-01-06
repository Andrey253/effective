// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:effective/block/state.dart';
import 'package:effective/widgets/cart/cart_home.dart';
import 'package:effective/widgets/details/detais_home.dart';
import 'package:flutter/material.dart';

import 'package:effective/block/details_state.dart';
import 'package:effective/block/home_block.dart';
import 'package:effective/model/details_model.dart';
import 'package:effective/repository/repository.dart';

class DetailsBloc extends AppBlock<DetailsState> {
  final String urlDetails;

  DetailsBloc(
      {required this.urlDetails,
      required super.repository,
      required super.type}) {
    init();
  }

  void init() async {
    try {
      final request = await Dio()
          .get(urlDetails, options: Options(responseType: ResponseType.json));
      final details = Details.fromJson(request.data);
      repository.details = details;
      repository.product = details.getProduct;
      emit(GetingDetailsDoneState(details: details));
    } on Exception catch (e) {
      emit(ErrorDetailsState(error: e.toString()));
    }
  }

  void setColor(String e) {
    repository.product = repository.product.copyWith(color: e);
    emit(UpdateProductState(property: e));
  }

  void setCapacity(String e) {
    repository.product = repository.product.copyWith(capacity: e);
    emit(UpdateProductState(property: e));
  }

  void addToCart() {
    repository.cart.add(repository.product);
    emit(UpdateCartState(cart: List.from(repository.cart)));
  }
    void navigateToCart(
      BuildContext context,  Repository repository) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CartWidget(
        repository: repository,
    
      ),
    ));
    // emit(GetingDetails(url: url));
  }
}
