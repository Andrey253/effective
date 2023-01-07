import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective/block/home_block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/model/store/store.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/details/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotSales extends StatelessWidget {
  const HotSales({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final block = context.read<HomeBloc>();
    final width = MediaQuery.of(context).size.width;
    final height = width * 0.45;
    // print('teg $width');
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: height * 0.06, vertical: height * 0.05),
              child: SizedBox(
                height: height,
                child: PageView.builder(
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        width: width * 0.31 + 1,
                        height: height,
                        child: Container(
                          width: width * 0.31,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(width * 0.024),
                                bottomLeft: Radius.circular(width * 0.024)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.05,
                                bottom: width * 0.03,
                                top: width * 0.03),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (block.repository.store.homeStore[index]
                                        .isNew ==
                                    true)
                                  CircleAvatar(
                                    backgroundColor: ColorsConst.red,
                                    radius: width * 0.032,
                                    child: Text(
                                      'New',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontFamily: 'SFPRODISPLAYREGULAR',
                                          fontSize: width * 0.022),
                                    ),
                                  )
                                else
                                  Container(
                                    height: width * 0.064,
                                  ),
                                Text(
                                  block.repository.store.homeStore[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontFamily: 'SFPRODISPLAYREGULAR',
                                      fontSize: width * 0.055),
                                ),
                                Text(
                                  block.repository.store.homeStore[index]
                                      .subtitle,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontFamily: 'SFPRODISPLAYREGULAR',
                                      fontSize: width * 0.024),
                                ),
                                ElevatedButton(
                                    onPressed: () => block.navigateToDetails(
                                        context, urlDetails, block.repository),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(width * 0.23,
                                          width * 0.055), // Set this
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Text(
                                      'Buy now!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                          fontFamily: 'SFPRODISPLAYREGULAR',
                                          fontSize: width * 0.024),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.31,
                        top: 0,
                        width: width - 15 * 2 - width * 0.31,
                        height: height,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(width * 0.024),
                                bottomRight: Radius.circular(width * 0.024)),
                            image: DecorationImage(
                              alignment: Alignment.centerLeft,
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(block
                                  .repository.store.homeStore[index].picture),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  itemCount: block.repository.store.homeStore.length,
                ),
              ),
            ));
  }
}
