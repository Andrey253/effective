import 'package:carousel_slider/carousel_slider.dart';
import 'package:effective/block/block.dart';
import 'package:effective/block/details_block.dart';
import 'package:effective/block/details_state.dart';
import 'package:effective/help/widgets.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/details/carousel_details.dart';
import 'package:effective/widgets/details/perfomance.dart';
import 'package:effective/widgets/details/top_details.dart';
import 'package:effective/widgets/filter/buttons_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) => SafeArea(
              child: Scaffold(
                backgroundColor: ColorsConst.backGround,
                body: state is GetingDetailsDoneState
                    ? ListView(
                        children: [
                          TopDetails(width: width),
                          CarouselWidget(listImages: state.details.images),
                          Text(state.details.title),
                          Perfomance(details: state.details)
                        ],
                      )
                    : Column(
                        children: [
                          TopDetails(width: width),
                          Center(child: Text('Downloads..')),
                        ],
                      ),
              ),
            ));
  }
}
