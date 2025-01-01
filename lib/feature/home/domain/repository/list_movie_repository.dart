import 'package:film_time/feature/home/domain/entity/list_movie_entity.dart';

abstract class ListMovieRepository {
  Future<ListMovieEntity?> getNewMovie(int page);
  Future<ListMovieEntity?> getMovieByCategory(String slug, int page);
  Future<ListMovieEntity?> getMovieByType(String slug, int page);
  Future<ListMovieEntity?> getMovieByNation(String slug, int page);
  Future<ListMovieEntity?> getMovieByTime(String slug, int page);
}
