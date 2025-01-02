import 'package:film_time/feature/detail_screen/data/data.dart';
import 'package:film_time/feature/detail_screen/domain/domain.dart';

class MovieDetailRepoImpl implements MovieDetailRepo {
  final DetailMovieApi _detailMovieApi;
  MovieDetailRepoImpl(this._detailMovieApi);
  @override
  Future<MovieDetailEntity?> getMovieDetail(String slug) async {
    final response = await _detailMovieApi.getDetailMovie(slug);
    // print(response);
    final movie = MovieDetailModel.fromJson(response.data['movie']);

    final result = movie.toEntity(movie);

    // print(result.episodes![1].items![1].name.toString());
    return result;
  }
}
