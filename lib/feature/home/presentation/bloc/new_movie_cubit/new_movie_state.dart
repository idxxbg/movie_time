import 'package:film_time/feature/home/domain/entity/list_movie_entity.dart';

abstract class NewMovieState {}

class NewMovieInitial extends NewMovieState {}

class NewMovieLoading extends NewMovieState {}

class NewMovieLoaded extends NewMovieState {
  final ListMovieEntity listMovie;
  NewMovieLoaded(
    this.listMovie,
  );
}

class NewMovieError extends NewMovieState {
  final String error;
  NewMovieError(this.error);
}
