import 'package:film_time/feature/home/home.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final ListMovieEntity listMovie;
  SearchLoaded(this.listMovie);
}

class SearchError extends SearchState {
  final String error;
  SearchError(this.error);
}
