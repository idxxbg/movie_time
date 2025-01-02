import 'package:film_time/feature/home/data/data_sourcre/remote/list_movie_api.dart';
import 'package:film_time/feature/home/data/models/list_movie_model.dart';

import 'package:film_time/feature/home/domain/domain.dart';

class ListMovieReposiotyImpl implements ListMovieRepository {
  final ListMovieApi listMovieApi;
  ListMovieReposiotyImpl(this.listMovieApi);
  @override
  Future<ListMovieEntity?> getNewMovie(int page) async {
    final response = await listMovieApi.fetchNewMovie(page);

    // In ra số lượng phần tử để kiểm tra
    // print('Response type: ${response.data}');
    if (response.data != null) {
      final model = ListMovieModel.fromJson(response.data);

      return model.toEntity(model);
    }
    return null;
  }

  // Get moive by category
  @override
  Future<ListMovieEntity?> getMovieByCategory(String slug, int page) async {
    final response = await listMovieApi.fetchCategoryMovie(slug, page);

    // Deserialize JSON thành ListMovieModel
    final model = ListMovieModel.fromJson(response.data);

    // In ra số lượng phần tử để kiểm tra

    // Chuyển từng phần tử từ MovieModel sang MovieEntity
    final entities =
        model.items.map((movieModel) => movieModel.toEntity()).toList();

    // Trả về đối tượng ListMovieEntity
    return ListMovieEntity(items: entities);
  }

  // Get moive by type
  @override
  Future<ListMovieEntity?> getMovieByType(String slug, int page) async {
    final response = await listMovieApi.fetchTypeMovie(slug, page);

    // Deserialize JSON thành ListMovieModel
    final model = ListMovieModel.fromJson(response.data);

    // In ra số lượng phần tử để kiểm tra

    // Chuyển từng phần tử từ MovieModel sang MovieEntity
    final entities =
        model.items.map((movieModel) => movieModel.toEntity()).toList();

    // Trả về đối tượng ListMovieEntity
    return ListMovieEntity(items: entities);
  }

  // Get moive by nation
  @override
  Future<ListMovieEntity?> getMovieByNation(String slug, int page) async {
    final response = await listMovieApi.fetchNationMovie(slug, page);

    // Deserialize JSON thành ListMovieModel
    final model = ListMovieModel.fromJson(response.data);

    // In ra số lượng phần tử để kiểm tra

    // Chuyển từng phần tử từ MovieModel sang MovieEntity
    final entities =
        model.items.map((movieModel) => movieModel.toEntity()).toList();

    // Trả về đối tượng ListMovieEntity
    return ListMovieEntity(items: entities);
  }

  // Get moive by time
  @override
  Future<ListMovieEntity?> getMovieByTime(String slug, int page) async {
    final response = await listMovieApi.fetchMovieByTime(slug, page);

    // Deserialize JSON thành ListMovieModel
    final model = ListMovieModel.fromJson(response.data);

    // In ra số lượng phần tử để kiểm tra

    // Chuyển từng phần tử từ MovieModel sang MovieEntity
    final entities =
        model.items.map((movieModel) => movieModel.toEntity()).toList();

    // Trả về đối tượng ListMovieEntity
    return ListMovieEntity(items: entities);
  }
}
