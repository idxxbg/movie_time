import 'package:film_time/feature/home/domain/entity/list_movie_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final ListMovieEntity listMovie;
  HomeLoaded(
    this.listMovie,
  );
}

class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}
