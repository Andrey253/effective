import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';

class HotSalesLine extends StatelessWidget {
  const HotSalesLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: const [
          Text(
            'Hot sales',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
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
    );
  }
}
