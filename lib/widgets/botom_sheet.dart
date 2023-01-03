import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class BottonSheet extends StatelessWidget {
  const BottonSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: ColorsConst.textColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SvgIcon(
                    color: Colors.white,
                    size: 10,
                    icon: SvgIconData('assets/svg/point.svg')),
                SizedBox(width: 8),
                Text(
                  'Explorer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SvgIcon(
                color: Colors.white,
                size: 20,
                icon: SvgIconData('assets/svg/wallet.svg')),
            SvgIcon(
                color: Colors.white,
                size: 20,
                icon: SvgIconData('assets/svg/favorit.svg')),
            SvgIcon(
                color: Colors.white,
                size: 20,
                icon: SvgIconData('assets/svg/person.svg'))
          ],
        ),
      ),
    );
  }
}
