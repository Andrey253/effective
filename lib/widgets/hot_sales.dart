
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';

class HotSalesWidget extends StatelessWidget {
  const HotSalesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontal, vertical: 10),
      child: Row(
        children: const [
          Text(
            'Hot sales',
            style: TextStyle(fontSize: 25),
          ),
          Spacer(),
          Text(
            'see more',
            style: TextStyle(fontSize: 19, color: ColorsConst.red),
          )
        ],
      ),
    );
  }
}
