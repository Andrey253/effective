import 'package:effective/model/details_model.dart';
import 'package:equatable/equatable.dart';



abstract class DetailsState extends Equatable {
  const DetailsState();
}

class GetingDetailsState extends DetailsState {
  const GetingDetailsState();
  // final String url;

  @override
  List<Object> get props => [];
}
class GetingDetailsDoneState extends DetailsState {
  const GetingDetailsDoneState({required this.details});
  final Details details;

  @override
  List<Object> get props => [details];
}
class ErrorDetailsState extends DetailsState {
  const ErrorDetailsState({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
