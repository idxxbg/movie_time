import 'package:film_time/core/constants/end_points.dart';
import 'package:film_time/feature_2/home/domain/entity/list_movie_entity.dart';

abstract class ListMovieRepository2 {
  Future<ListMovieEntity?> getListNewMovie(int page);
  Future<ListMovieEntity?> getListMoviebyType(EndPoints slug, int page);
}
