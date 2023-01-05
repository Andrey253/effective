import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
    required this.listImages,
  }) : super(key: key);
  final List<String> listImages;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: listImages.length,
        itemBuilder: itemBuilder,
        options: CarouselOptions(
          enlargeFactor: 0.4,
          aspectRatio: 6 / 39,
          viewportFraction: 0.6,
          height: 400,
          // pageSnapping: false,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ));
  }

  Widget itemBuilder(BuildContext context, int index, int realIndex) {
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
            imageUrl: listImages[index],
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
