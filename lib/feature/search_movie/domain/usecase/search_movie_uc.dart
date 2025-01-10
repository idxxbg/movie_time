import 'package:film_time/feature/home/domain/domain.dart';
import 'package:film_time/feature/search_movie/domain/domain.dart';

class SearchMovieUseCase {
  SearchMovieRepo repo;

  SearchMovieUseCase(this.repo);

  Future<ListMovieEntity?> searchMovie(String keyword, int limit) async {
    return await repo.searchMovie(keyword, limit);
  }
}
