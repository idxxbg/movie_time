import 'package:film_time/feature/home/home.dart';

abstract class SearchMovieRepo {
  Future<ListMovieEntity?> searchMovie(String keyword, int limit);
}
