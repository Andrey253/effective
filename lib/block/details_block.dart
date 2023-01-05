import 'package:dio/dio.dart';
import 'package:effective/block/details_state.dart';
import 'package:effective/model/details_model.dart';
import 'package:effective/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsBloc extends Cubit<DetailsState> {
  DetailsBloc({required this.repository, required this.urlDetails})
      : super(const GetingDetailsState()) {
    init();
  }

  final Repository repository;
  final String urlDetails;

  void init() async {
    try {
      final e = await Dio()
          .get(urlDetails, options: Options(responseType: ResponseType.json));
      final f = Details.fromJson(e.data);
       print('teg ${f.images}');
      emit(GetingDetailsDoneState(details: f));
    } on Exception catch (e) {
      emit(ErrorDetailsState(error: e.toString()));
    }
  }
}
