import 'package:effective/help/widgets.dart';
import 'package:effective/model/details_model.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/details/perfomance/details_details.dart';
import 'package:effective/widgets/details/perfomance/feature_details.dart';
import 'package:effective/widgets/details/perfomance/shop_details.dart';
import 'package:flutter/material.dart';

class PerfomanceBox extends StatefulWidget {
  const PerfomanceBox({
    Key? key,
    required this.details,
  }) : super(key: key);
  final Details details;
  @override
  State<PerfomanceBox> createState() => _PerfomanceBoxState();
}

class _PerfomanceBoxState extends State<PerfomanceBox> {
  List<String> menu = [];
  Map<String, Widget> widgets = {};

  String selected = '';
  @override
  void initState() {
    widgets = {
      'Shop': ShopDetails(details: widget.details),
      'Details': DetailsDetails(details: widget.details),
      'Feature': FeatutrDetails(details: widget.details)
    };
    menu = widgets.entries.map((e) => e.key).toList();
    selected = menu.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 33, right: 35),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: menu
                  .map(
                    (e) => Column(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() {
                            selected = e;
                          }),
                          child: TextWS(
                            text: e,
                            width: width,
                            size: 20,
                            fontWeight: selected == e
                                ? FontWeight.w800
                                : FontWeight.w500,
                            color: selected == e
                                ? ColorsConst.textColor
                                : Colors.grey,
                          ),
                        ),
                        Container(
                            height: 3,
                            width: 99,
                            color: selected == e
                                ? ColorsConst.red
                                : Colors.transparent)
                      ],
                    ),
                  )
                  .toList()),
          SizedBox(height: 30),
          widgets[selected]!
        ],
      ),
    );
  }
}
