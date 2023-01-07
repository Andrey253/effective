import 'package:effective/source/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class Flash extends StatelessWidget {
  const Flash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorsConst.textColor,
        child: Center(child: Image.asset('assets/images/splash.PNG')),
      ),
    );
  }
}
