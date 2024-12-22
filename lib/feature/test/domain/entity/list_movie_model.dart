import 'package:film_time/core/constants/constants.dart';
import 'package:film_time/core/data/models/movie_model.dart';

class ListMovieModel {
  final List<MovieModel>? listMovie;
  ListMovieModel({required this.listMovie});

  factory ListMovieModel.fromJson(Map<String, dynamic> json) {
    return ListMovieModel(
        listMovie: (json[kItems] as List<dynamic>)
            .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
            .toList());
  }
}
