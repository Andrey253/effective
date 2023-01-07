import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final radius = width * 0.075;
    final padding = radius / 2.5;
    final h = MediaQuery.of(context).size.height * 0.07;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(padding),
                height: width * 0.09,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 10, spreadRadius: 2)
                    ],
                    color: Colors.white,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(h / 2))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: ColorsConst.red,
                          ),
                          hintText: "Search",
                          border: InputBorder.none)),
                ),
              ),
            ),
            // CircleAvatar(
            //   backgroundColor: ColorsConst.padding,
            //   radius: (h + padding) / 2,
            //   child: CircleAvatar(
            //       backgroundColor: ColorsConst.red,
            //       radius: (h - padding) / 2,
            //       child: SvgIcon(
            //           color: Colors.white,
            //           size: width * 0.05,
            //           icon: const SvgIconData('assets/svg/search_param.svg'))),
            // ),
            Container(
                height: width * 0.09,
                width: width * 0.09,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 10, spreadRadius: 2)
                  ],
                  shape: BoxShape.circle,
                  color: ColorsConst.red,
                ),
                child: Center(
                  child: SvgIcon(
                      color: Colors.white,
                      size: 25,
                      icon: const SvgIconData('assets/svg/search_param.svg')),
                ))
          ],
        ));
  }
}
