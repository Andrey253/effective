import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class Stars extends StatelessWidget {
  const Stars({super.key, required this.raiting});
  final double raiting;
  @override
  Widget build(BuildContext context) {
    print('teg $raiting');
    return RatingStars(
        value: raiting,
        starBuilder: (index, color) => Icon(Icons.star, color: color),
        starCount: 5,
        starSize: 20,
        maxValue: 5,
        starSpacing: 20,
        valueLabelVisibility: false,
        starColor: ColorsConst.star);
  }
}
        // onValueChanged: (v) {},
        // valueLabelMargin: const EdgeInsets.all(0),
        // maxValueVisibility: false,
        // animationDuration: Duration(milliseconds: 1000),
        // valueLabelPadding:
        //     const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
        // starOffColor: const Color(0xffe7e8ea),
                // valueLabelColor: const Color(0xff9b9b9b),
        // valueLabelTextStyle: const TextStyle(
        //     color: Colors.white,
        //     fontWeight: FontWeight.w400,
        //     fontStyle: FontStyle.normal,
        //     fontSize: 12.0),
        // valueLabelRadius: 10,
