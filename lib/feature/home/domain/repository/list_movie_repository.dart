import 'package:film_time/feature/home/domain/entity/list_movie_entity.dart';

abstract class ListMovieRepository {
  Future<ListMovieEntity?> getNewMovie(int page);
  Future<ListMovieEntity?> getMovieByCategory(String slug, int page);
}
