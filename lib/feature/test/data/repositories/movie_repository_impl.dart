import 'package:film_time/core/constants/constants.dart';
import 'package:film_time/feature/test/data/data_source/movie_remote_data_source.dart';
import 'package:film_time/feature/test/domain/repository/movie_repository.dart';

import '../../domain/entity/list_movie_model.dart';
import '../../domain/entity/movie_detail_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  // Get new movie
  @override
  Future<ListMovieModel?> getNewMovie(int page) async {
    final response = await remoteDataSource.fetchNewMovie(page);
    return ListMovieModel.fromJson(response.data);
  }

  // Get moive by category
  @override
  Future<ListMovieModel?> getMovieByCategory(String slug, int page) async {
    final response = await remoteDataSource.fetchCategoryMovie(slug, page);
    return ListMovieModel.fromJson(response.data);
  }

  // Get detail movie
  @override
  Future<MovieDetailModel?> getMovieDetail(String slug) async {
    final response = await remoteDataSource.fetchDetail(slug);
    return MovieDetailModel.fromJson(response.data[kMovie]);
  }

  // Get moive by type
  @override
  Future<ListMovieModel?> getMovieByType(String slug, int page) async {
    final response = await remoteDataSource.fetchTypeMovie(slug, page);
    return ListMovieModel.fromJson(response.data);
  }

  // Get moive by nation
  @override
  Future<ListMovieModel?> getMovieByNation(String slug, int page) async {
    final response = await remoteDataSource.fetchNationMovie(slug, page);
    return ListMovieModel.fromJson(response.data);
  }

  // Get moive by time
  @override
  Future<ListMovieModel?> getMovieByTime(String slug, int page) async {
    final response = await remoteDataSource.fetchMovieByTime(slug, page);
    return ListMovieModel.fromJson(response.data);
  }

  // search movie
  @override
  Future<ListMovieModel?> searchMovie(String slug) async {
    final response = await remoteDataSource.searchMovie(slug);
    return ListMovieModel.fromJson(response.data);
  }
}
