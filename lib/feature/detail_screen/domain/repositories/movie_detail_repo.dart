import '../domain.dart';

abstract class MovieDetailRepo {
  Future<MovieDetailEntity?> getMovieDetail(String slug);
}
