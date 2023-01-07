import 'package:effective/block/home_block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/model/category.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class CategoryesWidget extends StatelessWidget {
  const CategoryesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final block = context.read<HomeBloc>();
    final width = MediaQuery.of(context).size.width;
    final radius = width * 0.075;
    final padding = radius / 2.5;

    return Container(
      height: (radius + padding) * 2 + width * 0.04,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) => ListView(
                  scrollDirection: Axis.horizontal,
                  children: block.repository.listCategory
                      .map((e) => Column(
                            children: [
                              GestureDetector(
                                onTap: () => block.selectCategory(e),
                                child: CircleAvatar(
                                  backgroundColor: ColorsConst.padding,
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
                                height: width * 0.04,
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
                      .toList()))),
    );
  }
}
