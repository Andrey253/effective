import 'package:effective/block/details_block.dart';
import 'package:effective/block/details_state.dart';
import 'package:effective/help/widgets.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/help/buttons_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class TopDetails extends StatelessWidget {
  const TopDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final block = context.read<DetailsBloc>();
    return BlocBuilder<DetailsBloc, DetailsState>(
        // buildWhen: (previous, current) => current is FilterState,
        builder: (context, state) => Padding(
              padding: EdgeInsets.all(width * 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonsApp(
                      width: width * 0.09,
                      height: width * 0.09,
                      circular: 10,
                      backgroundColor: ColorsConst.textColor,
                      child: const Icon(Icons.keyboard_arrow_left, size: 35),
                      onPressed: () => Navigator.of(context).pop()),
                  TextWS(
                    text: 'Product Details',
                    width: width,
                    size: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorsConst.textColor,
                  ),
                  Stack(children: [
                    ButtonsApp(
                        width: width * 0.09,
                        height: width * 0.09,
                        circular: 10,
                        backgroundColor: ColorsConst.red,
                        onPressed:() =>  block.navigateToCart(context, block. repository),
                        child: const SvgIcon(
                            color: Colors.white,
                            size: 20,
                            icon: SvgIconData('assets/svg/wallet.svg'))),
                    if (block.repository.cart.isNotEmpty)
                      CircleAvatar(
                          radius: 10,
                          child: Text(block.repository.cart.length.toString()))
                  ])
                ],
              ),
            ));
  }
}
