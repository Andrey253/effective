import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/help/widgets.dart';
import 'package:effective/model/details_model.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/details/perfomance3.dart';
import 'package:effective/widgets/filter/buttons_app.dart';
import 'package:effective/widgets/filter/name_params_filtert.dart';
import 'package:effective/widgets/filter/select_params_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Perfomance extends StatelessWidget {
  const Perfomance({super.key, required this.details});
  final Details details;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final circular = width * 0.08;
    final block = context.read<AppBloc>();
    return BlocBuilder<AppBloc, HomeState>(
        buildWhen: (previous, current) => current is FilterState,
        builder: (context, state) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(circular),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -10))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 33),
                    Padding(
                      padding: const EdgeInsets.only(left: 44, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWS(
                            text: details.title,
                            width: width,
                            size: 24,
                            fontWeight: FontWeight.w500,
                            color: ColorsConst.textColor,
                          ),
                          ButtonsApp(
                              width: width * 0.09,
                              height: width * 0.09,
                              circular: 10,
                              backgroundColor: ColorsConst.textColor,
                              onPressed: () {},
                              child: details.isFavorites
                                  ? const Icon(
                                      Icons.favorite,
                                      color: ColorsConst.red,
                                    )
                                  : const Icon(Icons.favorite_outline))
                        ],
                      ),
                    ),
                    Perfomance3(details: details,)
                  ],
                ),
              ),
            ));
  }
}

