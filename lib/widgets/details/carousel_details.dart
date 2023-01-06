import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:effective/block/home_block.dart';
import 'package:effective/block/details_block.dart';
import 'package:effective/block/details_state.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final block = context.read<DetailsBloc>();
    return BlocBuilder<DetailsBloc, DetailsState>(
        buildWhen: (previous, current) => current is GetingDetailsDoneState,
        builder: (context, state) => state is GetingDetailsState
            ? const SizedBox.shrink()
            : CarouselSlider.builder(
                itemCount: block.repository.details.images.length,
                itemBuilder: (context, index, realIndex) =>
                    itemBuilder(context, block, index, realIndex),
                options: CarouselOptions(
                  enlargeFactor: 0.4,
                  aspectRatio: 6 / 39,
                  viewportFraction: 0.6,
                  height: 400,
                  // pageSnapping: false,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                )));
  }

  Widget itemBuilder(
      BuildContext context, DetailsBloc block, int index, int realIndex) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 6, blurRadius: 12, color: ColorsConst.grey)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: CachedNetworkImage(
            imageUrl: block.repository.details.images[index],
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
