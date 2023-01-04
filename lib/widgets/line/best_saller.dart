import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerLine extends StatelessWidget {
  const BestSellerLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        builder: (context, state) => state is FilterState
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: const [
                    Text(
                      'Best Seller',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    Text(
                      'see more',
                      style: TextStyle(
                          fontSize: 17,
                          color: ColorsConst.red,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ));
  }
}
