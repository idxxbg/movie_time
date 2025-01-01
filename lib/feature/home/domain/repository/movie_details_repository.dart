import '../../../../core/data/models/movie_detail_model.dart';

abstract class MovieDetailsRepository {
  Future<MovieDetailModel?> getMovieDetail(String slug);
}
