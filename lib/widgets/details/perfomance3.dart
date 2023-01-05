import 'package:effective/help/widgets.dart';
import 'package:effective/model/details_model.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/details/shop_details.dart';
import 'package:flutter/material.dart';

class Perfomance3 extends StatefulWidget {
  const Perfomance3({
    Key? key,
    required this.details,
  }) : super(key: key);
  final Details details;
  @override
  State<Perfomance3> createState() => _Perfomance3State();
}

class _Perfomance3State extends State<Perfomance3> {
  final menu = ['Shop', 'Detals', 'Feature'];
  Map<String, Widget> widgets = {};

  String selected = 'Shop';
  @override
  void initState() {
    selected = menu.first;
    widgets = {
      'Shop': ShopdEtails(details: widget.details),
      'Detals': ShopdEtails(details: widget.details),
      'Feature': ShopdEtails(details: widget.details)
    };
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
                  widgets[selected]!
        ],
      ),
    );
  }
}
