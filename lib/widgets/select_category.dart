
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontal, vertical: 10),
      child: Row(
        children: const [
          Text(
            'Select category',
            style: TextStyle(fontSize: 25),
          ),
          Spacer(),
          Text(
            'view all',
            style: TextStyle(fontSize: 19, color: ColorsConst.red),
          )
        ],
      ),
    );
  }
}
