import 'package:film_time/feature/home/data/data_sourcre/remote/list_movie_api.dart';
import 'package:film_time/feature/home/data/models/list_movie_model.dart';

import 'package:film_time/feature/home/domain/domain.dart';

class ListMovieReposiotyImpl implements ListMovieRepository {
  final ListMovieApi listMovieApi;
  ListMovieReposiotyImpl(this.listMovieApi);
  @override
  Future<ListMovieEntity?> getNewMovie(int page) async {
    final response = await listMovieApi.fetchNewMovie(page);
    if (response.data != null) {
      final model = ListMovieModel.fromJson(response.data);
      return model.toEnity(model);
    }
    return null;
  }

  // Get moive by category
  @override
  Future<ListMovieEntity?> getMovieByCategory(String slug, int page) async {
    final response = await listMovieApi.fetchCategoryMovie(slug, page);

    // Deserialize JSON thành ListMovieModel
    final model = ListMovieModel.fromJson(response.data['data']);
    final entities =
        model.items.map((movieModel) => movieModel.toEntity()).toList();

    // Trả về đối tượng ListMovieEntity
    return ListMovieEntity(entities);
  }
}
