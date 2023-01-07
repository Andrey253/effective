import 'package:effective/block/details_block.dart';
import 'package:effective/block/details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) =>state is GetingDetailsState?
          const Center(child: Text('Downloads..')): const SizedBox.shrink(),
    );
  }
}
