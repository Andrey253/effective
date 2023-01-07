import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective/block/home_block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/model/store/store.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/filter/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final block = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => state is FilterState
            ? const FilterWidget()
            : Padding(
                padding: EdgeInsets.all(width * 0.02),
                child: GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 5,
                  children: block.repository.store.bestSeller
                      .map((e) => GestureDetector(
                            onTap: () => block.navigateToDetails(
                                context, urlDetails, block.repository),
                            child: Padding(
                              padding: EdgeInsets.all(width * 0.02),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(width * 0.04),
                                    boxShadow: [
                                      BoxShadow(
                                          color: ColorsConst.padding,
                                          spreadRadius: width * 0.03),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(width * 0.013),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: e.picture,
                                              height: width / 2.5,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width * 0.036),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      '\$ ${e.priceWithoutDiscount.toString()}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              width * 0.032)),
                                                  SizedBox(width: width * 0.02),
                                                  Text(
                                                      '\$ ${e.discountPrice.toString()}',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              width * 0.02,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough))
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: width * 0.012),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width * 0.036),
                                              child: Text(
                                                e.title,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: width * 0.02),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(width * 0.036),
                                            child: Container(
                                              height: width * 0.06,
                                              width: width * 0.06,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width * 0.06),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.05),
                                                      spreadRadius: 6),
                                                ],
                                              ),
                                              child: Icon(
                                                  e.isFavorites
                                                      ? Icons.favorite
                                                      : Icons.favorite_outline,
                                                  color: ColorsConst.red,
                                                  size: width * 0.036),
                                            ),
                                          ))
                                    ],
                                  )),
                            ),
                          ))
                      .toList(),
                ),
              ));
  }
}
