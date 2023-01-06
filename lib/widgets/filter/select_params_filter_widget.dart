import 'package:effective/block/home_block.dart';
import 'package:flutter/material.dart';

class SelectParamsFilterWidget extends StatelessWidget {

  const SelectParamsFilterWidget({
    Key? key, required this.items, required this.value,required this.onChanged,
  }) : super(key: key);


  final List<String> items;
  final void Function(String?)? onChanged;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 10, bottom: 20, right: 10),
      child: InputDecorator(
          decoration: const InputDecoration(
            border: OutlineInputBorder(gapPadding: 0),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15),
          ),
          child: DropdownButton<String>(
              items: items
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18)),
                      ))
                  .toList(),
              onChanged: onChanged,
              value: value,
              isExpanded: true,
              underline: SizedBox.shrink())),
    );
  }
}


