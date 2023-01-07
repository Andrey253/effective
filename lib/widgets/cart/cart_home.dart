import 'package:effective/block/cart_block.dart';
import 'package:effective/block/cart_state.dart';
import 'package:effective/block/details_block.dart';
import 'package:effective/block/details_state.dart';
import 'package:effective/help/widgets.dart';
import 'package:effective/repository/repository.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/cart/box_cart.dart';
import 'package:effective/widgets/cart/top_cart.dart';
import 'package:effective/widgets/details/carousel_details.dart';
import 'package:effective/widgets/details/loading.dart';
import 'package:effective/widgets/details/perfomance/perfomance.dart';
import 'package:effective/widgets/details/top_details.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key, required this.repository});
  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBlock>(
        create: (_) =>
            CartBlock(type: const InitCartState(), repository: repository),
        child: Scaffold(
            appBar: AppBar(
              title: const TopCart(),
              shadowColor: Colors.transparent,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: ColorsConst.backGround,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                    child: TextWS(
                        text: 'My Cart',
                        width: 414,
                        size: 35,
                        fontWeight: FontWeight.w700,
                        color: ColorsConst.textColor),
                  ),
                  BoxCart()
                ])));
  }
}
