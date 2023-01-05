import 'package:effective/help/widgets.dart';
import 'package:effective/model/details_model.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class ShopDetails extends StatelessWidget {
  const ShopDetails({super.key, required this.details});
  final Details details;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgIcon(
                      color: ColorsConst.details,
                      size: 28,
                      icon: SvgIconData('assets/svg/perfomance/cpu.svg')),
                ),
                TextWS(
                    text: details.cpu,
                    width: width,
                    size: 11,
                    fontWeight: FontWeight.w400,
                    color: ColorsConst.details),
              ],
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgIcon(
                      color: ColorsConst.details,
                      size: 28,
                      icon: SvgIconData('assets/svg/perfomance/camera.svg')),
                ),
                TextWS(
                    text: details.camera,
                    width: width,
                    size: 11,
                    fontWeight: FontWeight.w400,
                    color: ColorsConst.details),
              ],
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgIcon(
                      color: ColorsConst.details,
                      size: 28,
                      icon: SvgIconData('assets/svg/perfomance/ssd.svg')),
                ),
                TextWS(
                    text: details.ssd,
                    width: width,
                    size: 11,
                    fontWeight: FontWeight.w400,
                    color: ColorsConst.details),
              ],
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgIcon(
                      color: ColorsConst.details,
                      size: 28,
                      icon: SvgIconData('assets/svg/perfomance/sd.svg')),
                ),
                TextWS(
                    text: details.sd,
                    width: width,
                    size: 11,
                    fontWeight: FontWeight.w400,
                    color: ColorsConst.details),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
