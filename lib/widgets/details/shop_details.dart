import 'package:effective/model/details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShopdEtails extends StatelessWidget {
  const ShopdEtails({super.key, required this.details});
  final Details details;
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(this.runtimeType.toString()));
  }
}