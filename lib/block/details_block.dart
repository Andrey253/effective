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
      final request = await Dio()
          .get(urlDetails, options: Options(responseType: ResponseType.json));
      final details = Details.fromJson(request.data);
      repository.details = details;
      repository.product = details.getProduct;
      emit(GetingDetailsDoneState(details: details));
    } on Exception catch (e) {
      emit(ErrorDetailsState(error: e.toString()));
    }
  }

  void setColor(String e) {
    repository.product = repository.product.copyWith(color: e);
    emit(UpdateProductState(property: e));
  }

  void setCapacity(String e) {
    repository.product = repository.product.copyWith(capacity: e);
    emit(UpdateProductState(property: e));
  }
}
