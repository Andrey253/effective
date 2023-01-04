import 'package:flutter/material.dart';

class NameParamsFilterWidget extends StatelessWidget {
  const NameParamsFilterWidget({
    Key? key, required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return  Text(name,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18));
  }
}