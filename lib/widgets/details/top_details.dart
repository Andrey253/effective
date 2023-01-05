import 'package:effective/help/widgets.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/filter/buttons_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class TopDetails extends StatelessWidget {
  const TopDetails({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(width * 0.05),
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
            size: 18,fontWeight: FontWeight.w500,color: ColorsConst.textColor,
          ),
          ButtonsApp(
              width: width * 0.09,
              height: width * 0.09,
              circular: 10,
              backgroundColor: ColorsConst.red,
              onPressed: () {},
              child: const SvgIcon(
                  color: Colors.white,
                  size: 20,
                  icon: SvgIconData('assets/svg/wallet.svg')))
        ],
      ),
    );
  }
}
