import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/filter/buttons_app.dart';
import 'package:effective/widgets/filter/name_params_filtert.dart';
import 'package:effective/widgets/filter/select_params_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

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
                padding: const EdgeInsets.only(left: 44, right: 20, top: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(circular),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -10)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonsApp(
                            width: width * 0.09,
                            height: width * 0.09,
                            circular: 10,
                            backgroundColor: ColorsConst.textColor,
                            onPressed: block.cancelFilter,
                            child:
                                const Icon(Icons.close, color: Colors.white)),
                        const Text(
                          'Filter options',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        ButtonsApp(
                            width: width * 0.21,
                            height: width * 0.09,
                            circular: 10,
                            backgroundColor: ColorsConst.red,
                            onPressed: block.doneFilter,
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ))
                      ],
                    ),
                    const SizedBox(height: 40),
                    const NameParamsFilterWidget(name: 'Brand'),
                    SelectParamsFilterWidget(
                        items: block.repository.filterParams.listBrands,
                        value: block.repository.filterParams.brand,
                        onChanged: block.setBrend),
                    const NameParamsFilterWidget(name: 'Price'),
                    SelectParamsFilterWidget(
                        items: block.repository.filterParams.listPrices,
                        value: block.repository.filterParams.price,
                        onChanged: block.setPrice),
                    const NameParamsFilterWidget(name: 'Size'),
                    SelectParamsFilterWidget(
                        items: block.repository.filterParams.listSizes,
                        value: block.repository.filterParams.size,
                        onChanged: block.setSize),
                  ],
                ),
              ),
            ));
  }
}
