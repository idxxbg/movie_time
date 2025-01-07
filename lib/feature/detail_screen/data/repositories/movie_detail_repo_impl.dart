import 'package:film_time/feature/detail_screen/data/data.dart';
import 'package:film_time/feature/detail_screen/domain/domain.dart';

class MovieDetailRepoImpl implements MovieDetailRepo {
  final DetailMovieApi _detailMovieApi;
  MovieDetailRepoImpl(this._detailMovieApi);
  @override
  Future<MovieDetailEntity?> getMovieDetail(String slug) async {
    final response = await _detailMovieApi.getDetailMovie(slug);

    final movie = MovieDetailModel.fromJson(response.data);
    final result = movie.toEntity();
    return result;
  }
}
