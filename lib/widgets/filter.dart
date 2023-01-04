import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/source/consts.dart';
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
    final circular = 30.0;
    final width = MediaQuery.of(context).size.width;
    final block = context.read<AppBloc>();
    return BlocBuilder<AppBloc, AppState>(
        builder: (context, state) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: width * 0.9,
                padding: EdgeInsets.only(left: 44, right: 20, top: 24),
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
                        ElevatedButton(
                            onPressed: block.cancelFilter,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: ColorsConst.textColor,
                              minimumSize:
                                  Size(width * 0.09, width * 0.09), // Set this
                              padding: EdgeInsets.zero,
                            ),
                            child:
                                const Icon(Icons.close, color: Colors.white)),
                        const Text(
                          'Filter options',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        ElevatedButton(
                            onPressed: block.doneFilter,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: ColorsConst.red,
                              minimumSize:
                                  Size(width * 0.21, width * 0.09), // Set this
                              padding: EdgeInsets.zero,
                            ),
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
                        block: block,
                        items: block.repository.filterParams.listBrands,
                        value: block.repository.filterParams.brand,
                        onChanged: block.setBrend),
                    // const SizedBox(height: 30),
                    const NameParamsFilterWidget(name: 'Price'),
                    SelectParamsFilterWidget(
                        block: block,
                        items: block.repository.filterParams.listPrices,
                        value: block.repository.filterParams.price,
                        onChanged: block.setPrice),

                    const NameParamsFilterWidget(name: 'Size'),
                    SelectParamsFilterWidget(
                        block: block,
                        items: block.repository.filterParams.listSizes,
                        value: block.repository.filterParams.size,
                        onChanged: block.setSize),
                  ],
                ),
              ),
            ));
  }
}
