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
    final circular = 20.0;
    final width = MediaQuery.of(context).size.width;
    final block = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => state is FilterState
            ? const FilterWidget()
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 5,
                  children: block.repository.store.bestSeller
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(circular),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: ColorsConst.padding,
                                        spreadRadius: 15),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(circular / 3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: e.picture,
                                            height: width / 2.5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                    '\$ ${e.priceWithoutDiscount.toString()}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16)),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                    '\$ ${e.discountPrice.toString()}',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 10,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 6),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18.0),
                                            child: Text(
                                              e.title,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
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
                                              size: 18,
                                            ),
                                          ),
                                        ))
                                  ],
                                )),
                          ))
                      .toList(),
                ),
              ));
  }
}
