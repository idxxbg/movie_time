import 'package:film_time/feature/detail_screen/detail_screen.dart';

class GetMovieDetailUc {
  final MovieDetailRepo _movieDetailRepo;
  GetMovieDetailUc(this._movieDetailRepo);

  Future<MovieDetailEntity?> call(String slug) async {
    return await _movieDetailRepo.getMovieDetail(slug);
  }
}
