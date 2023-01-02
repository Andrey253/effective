import 'package:effective/help/showsearch_city.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
    required this.dropdownValue,
  }) : super(key: key);

  final String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 18),
          Row(
            children: [
              const Icon(
                Icons.place_outlined,
                color: ColorsConst.red,
              ),
              const SizedBox(width: 8),
              Text(dropdownValue, style: const TextStyle(fontSize: 19)),
              IconButton(
                icon: const Icon(Icons.keyboard_arrow_down),
                onPressed: () async {
                          final city = await showSearch(
                              context: context, delegate: SearchCity());

                          // setState(() => dropdownValue = city);
                        },
              )
            ],
          ),
          const SvgIcon(
              size: 15, icon: SvgIconData('assets/svg/filter.svg')),
        ],
      ),
    );
  }
}
