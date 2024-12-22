import 'package:film_time/core/data/models/list_movie_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final ListMovieModel list;
  HomeLoaded(this.list);
}

class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}
