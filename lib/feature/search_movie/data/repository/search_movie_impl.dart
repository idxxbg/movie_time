import 'package:film_time/feature/home/data/data.dart';
import 'package:film_time/feature/home/domain/entity/list_movie_entity.dart';

import 'package:film_time/feature/search_movie/search_movie.dart';

class SearchMovieImpl extends SearchMovieRepo {
  final SearchApi api;
  SearchMovieImpl(this.api);
  @override
  Future<ListMovieEntity?> searchMovie(String keyword, int limit) async {
    final response = await api.fetchSearchMovie(keyword, limit);
    final model = ListMovieModel.fromJson(response.data['data']);
    final list = model.toEnity();
    return list;
  }
}
