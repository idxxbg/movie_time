import 'package:film_time/core/constants/end_points.dart';
import 'package:film_time/feature_2/home/domain/entity/list_movie_entity.dart';
import 'package:film_time/feature_2/home/domain/repository/list_movie_repository.dart';

abstract class GetListMovieUc {}

class GetListNewMovieUseCase2 extends GetListMovieUc {
  final ListMovieRepository2 repo;
  GetListNewMovieUseCase2(this.repo);

  Future<ListMovieEntity?> call(int page) async {
    return await repo.getListNewMovie(page);
  }
}

class GetListMovieByTypeUseCase2 extends GetListMovieUc {
  final ListMovieRepository2 repo;
  GetListMovieByTypeUseCase2(this.repo);

  Future<ListMovieEntity?> call(EndPoints slug, int page) async {
    return await repo.getListMoviebyType(slug, page);
  }
}
