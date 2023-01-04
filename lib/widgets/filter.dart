import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective/block/block.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final circular = 30.0;
    final width = MediaQuery.of(context).size.width;
        final block = context.read<AppBloc>();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: width * 0.9,
        padding: EdgeInsets.only(left: 44, right: 20, top: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(circular),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 10, offset: Offset(0, -10)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: block.cancelFilter,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: ColorsConst.textColor,
                      minimumSize: Size(width * 0.09, width * 0.09), // Set this
                      padding: EdgeInsets.zero,
                    )),
                Text(
                  'Filter options',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                ElevatedButton(
                    onPressed: block.doneFilter,
                    child: Text(
                      'Done',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: ColorsConst.red,
                      minimumSize: Size(width * 0.21, width * 0.09), // Set this
                      padding: EdgeInsets.zero,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
