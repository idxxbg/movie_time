import '../entity/list_movie_model.dart';
import '../entity/movie_detail_model.dart';

abstract class MovieRepository {
  Future<ListMovieModel?> getNewMovie(int page);
  Future<ListMovieModel?> getMovieByCategory(String slug, int page);
  Future<MovieDetailModel?> getMovieDetail(String slug);
  Future<ListMovieModel?> getMovieByType(String slug, int page);
  Future<ListMovieModel?> getMovieByNation(String slug, int page);
  Future<ListMovieModel?> getMovieByTime(String slug, int page);
  Future<ListMovieModel?> searchMovie(String slug);
}
