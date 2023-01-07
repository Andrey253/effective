import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective/block/cart_block.dart';
import 'package:effective/block/cart_state.dart';
import 'package:effective/block/state.dart';
import 'package:effective/help/button_add_remove.dart';
import 'package:effective/help/widgets.dart';
import 'package:effective/model/product_model.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoxCart extends StatelessWidget {
  const BoxCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final block = context.read<CartBlock>();
    return Expanded(
      child: BlocBuilder<CartBlock, CartState>(
          builder: (context, state) => state is FilterState
              ? const SizedBox.shrink()
              : Container(
                  decoration: BoxDecoration(
                    color: ColorsConst.textColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: ListView(children: [
                    const SizedBox(
                      height: 30,
                    ),
                    ...block.repository.cart
                        .map((e) => itemBuilder(e, block))
                        .toList(),
                  ]),
                )),
    );
  }

  Widget itemBuilder(Product product, CartBlock block) => Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              constraints: const BoxConstraints(maxHeight: 90, maxWidth: 90),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: ColorsConst.backGround,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: CachedNetworkImage(
                imageUrl: product.image,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWS(
                    text: product.title,
                    width: 414,
                    size: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                TextWS(
                    text: '\$ ${product.price * product.quantity}',
                    width: 414,
                    size: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorsConst.red)
              ],
            ),
            const Spacer(),
            ButtonAddRemove(block: block, product: product)
          ],
        ),
      );
}
