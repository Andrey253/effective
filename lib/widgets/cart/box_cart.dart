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
          builder: (context, state) {
            return Container(
                decoration: BoxDecoration(
                  color: ColorsConst.textColor,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.08),
                ),
                child: ListView.builder(
                  itemCount: block.repository.cart?.basket?.length,
                  itemBuilder: (context, index) => block
                      .repository.cart!.basket!
                      .map((e) => itemBuilder(index, block, context))
                      .toList()[index],
                ),
              );
          }),
    );
  }

  Widget itemBuilder(int index, CartBlock block, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(width * 0.06),
      child: Container(
        constraints: BoxConstraints(maxHeight: width * 0.2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: ColorsConst.backGround,
                borderRadius: BorderRadius.circular(width * 0.02),
              ),
              child: CachedNetworkImage(
                imageUrl: block.repository.cart?.basket?[index]?.images ?? '',
              ),
            ),
            SizedBox(width: width * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWS(
                    text: block.repository.cart?.basket?[index]?.title ?? '',
                    width: width,
                    size: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                const Spacer(),
                TextWS(
                    text:
                        '\$ ${(block.repository.cart?.basket?[index]?.price ?? 0) * (block.repository.cart?.basket?[index]?.quantity ?? 0)}',
                    width: width,
                    size: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorsConst.red)
              ],
            ),
            const Spacer(),
            ButtonAddRemove(block: block, index: index, width: width)
          ],
        ),
      ),
    );
  }
}
