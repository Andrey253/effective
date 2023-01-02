import 'package:effective/model/category.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class CategoryesWidget extends StatelessWidget {
  const CategoryesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final radius = width * 0.075;
    final padding = radius / 2.5;
    final heightText = 20;
    return Container(
      // width: MediaQuery.of(context).size.width,
      height: (radius + padding) * 2 + heightText,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: listCategory
                .map((e) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            listCategory.forEach((element) {
                              element.selected = false;
                            });
                            e.selected = true;
                          },
                          child: CircleAvatar(
                            backgroundColor: ColorsConst.white800,
                            radius: (padding + radius),
                            child: CircleAvatar(
                                backgroundColor: ColorsConst.red,
                                radius: radius,
                                child: SvgIcon(
                                    color: e.selected
                                        ? Colors.white
                                        : ColorsConst.grey,
                                    size: 30,
                                    icon: SvgIconData(e.asset))),
                          ),
                        ),
                        SizedBox(
                          height: heightText.toDouble(),
                          child: Text(
                            e.name,
                            style: TextStyle(
                                color: e.selected
                                    ? ColorsConst.red
                                    : ColorsConst.textColor,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ))
                .toList()),
      ),
    );
  }
}
