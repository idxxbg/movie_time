import 'package:film_time/feature/detail_screen/domain/domain.dart';

abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final MovieDetailEntity movieDetail;
  DetailLoaded(this.movieDetail);
}

class DetailError extends DetailState {
  DetailError(this.error);
  final String error;
}
