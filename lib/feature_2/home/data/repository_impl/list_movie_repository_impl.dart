import 'package:film_time/core/constants/end_points.dart';
import 'package:film_time/feature_2/home/data/data_source/remote/list_movie_api.dart';
import 'package:film_time/feature_2/home/data/models/list_movie_model.dart';
import 'package:film_time/feature_2/home/domain/entity/list_movie_entity.dart';
import 'package:film_time/feature_2/home/domain/repository/list_movie_repository.dart';

class ListMovieRepositoryImpl implements ListMovieRepository2 {
  final ListMovieApi2 api;
  ListMovieRepositoryImpl(this.api);

  @override
  Future<ListMovieEntity?> getListMoviebyType(EndPoints slug, int page) async {
    final response = await api.fetchMoviebyType(slug, page);
    final list = ListMovieModel.fromJson(response.data['data']);

    print(list.items[1].posterUrl);
    return list.toEnity(list);
  }

  @override
  Future<ListMovieEntity?> getListNewMovie(int page) async {
    final response = await api.fetchNewMovie(page);
    // print(response.data);
    final list = ListMovieModel.fromJson(response.data);
    return list.toEnity(list);
  }
}
