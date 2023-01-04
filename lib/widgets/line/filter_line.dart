import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class FilterLine extends StatelessWidget {
  const FilterLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final block = context.read<AppBloc>();

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: BlocBuilder<AppBloc, AppState>(
            buildWhen: (previous, current) => current is SelectCityState,
            builder: (context, state) {
              return Row(
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
                      Text(block.repository.city,
                          style: const TextStyle(fontSize: 19)),
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onPressed: () => block.selectCity(context),
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () => block.filter(),
                    icon: const SvgIcon(
                        size: 15, icon: SvgIconData('assets/svg/filter.svg')),
                  ),
                ],
              );
            }));
  }
}