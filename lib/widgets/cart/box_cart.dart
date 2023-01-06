import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective/block/cart_block.dart';
import 'package:effective/block/cart_state.dart';
import 'package:effective/block/home_block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/help/widgets.dart';
import 'package:effective/model/product_model.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

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
                    SizedBox(
                      height: 30,
                    ),
                    ...block.repository.cart
                        .map((e) => itemBuilder(e))
                        .toList(),
                  ]),
                )),
    );
  }

  Widget itemBuilder(Product e) => Padding(
        padding: const EdgeInsets.all(22.0),
        child: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints(maxHeight: 90, maxWidth: 90),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: ColorsConst.backGround,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: CachedNetworkImage(
                imageUrl: e.image,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWS(
                    text: e.title,
                    width: 414,
                    size: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                TextWS(
                    text: '\$ ${e.price * e.quantity}',
                    width: 414,
                    size: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorsConst.red)
              ],
            )
          ],
        ),
      );
}
