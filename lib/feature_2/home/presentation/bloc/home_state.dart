import 'package:film_time/feature_2/home/domain/entity/list_movie_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoader extends HomeState {
  final ListMovieEntity listMovie;
  HomeLoader(this.listMovie);
}

class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}
