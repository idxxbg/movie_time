import 'package:film_time/feature/home/domain/domain.dart';

abstract class GetListMovieUsecase {}

class GetListNewMovieUseCase extends GetListMovieUsecase {
  final ListMovieRepository movieRepo;
  GetListNewMovieUseCase(this.movieRepo);

  Future<ListMovieEntity?> call(int page) async {
    return await movieRepo.getNewMovie(page);
  }
}

class GetListMovieByCategoryUseCase extends GetListMovieUsecase {
  final ListMovieRepository movieRepo;
  GetListMovieByCategoryUseCase(this.movieRepo);

  Future<ListMovieEntity?> call(String slug, int page) async {
    return await movieRepo.getMovieByCategory(slug, page);
  }
}

class GetListMovieByTypeUseCase extends GetListMovieUsecase {
  final ListMovieRepository movieRepo;
  GetListMovieByTypeUseCase(this.movieRepo);

  Future<ListMovieEntity?> call(String slug, int page) async {
    return await movieRepo.getMovieByType(slug, page);
  }
}
