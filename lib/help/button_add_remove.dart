import 'package:effective/block/cart_block.dart';
import 'package:effective/block/home_block.dart';
import 'package:effective/model/product_model.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class ButtonAddRemove extends StatelessWidget {
  const ButtonAddRemove({
    Key? key,
    required this.block,
    required this.product,
  }) : super(key: key);

  final CartBlock block;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 80,
          width: 26,
          decoration: BoxDecoration(
            color: ColorsConst.addRemoveBackground,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.remove, color: Colors.white),
              Text(product.quantity.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white)),
              Icon(Icons.add, color: Colors.white)
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        SvgIcon(
            color: ColorsConst.deleteIcon,
            icon: const SvgIconData('assets/svg/cart/delete.svg'))
      ],
    );
  }
}
