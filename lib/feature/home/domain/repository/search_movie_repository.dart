import 'package:film_time/feature/home/data/models/list_movie_model.dart';

abstract class SearchMovieRepository {
  Future<ListMovieModel?> searchMovie(String slug);
}
