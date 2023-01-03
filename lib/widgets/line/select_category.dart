import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';

class SelectCategoryLine extends StatelessWidget {
  const SelectCategoryLine({
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
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          Spacer(),
          Text(
            'view all',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: ColorsConst.red),
          )
        ],
      ),
    );
  }
}
