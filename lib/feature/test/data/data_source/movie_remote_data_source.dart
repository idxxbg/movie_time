import 'package:dio/dio.dart';
import 'package:film_time/core/constants/api_constants.dart';
import 'package:film_time/core/network/api_client.dart';

class MovieRemoteDataSource {
  final ApiClient _apiClient;

  MovieRemoteDataSource(this._apiClient);

  // Fetch New movie
  Future<Response> fetchNewMovie(int page) async {
    return await _apiClient.get(
      ApiConstants.newMovie,
      queryParameters: {'page': page},
    );
  }

// Fetch Catergory phim
  Future<Response> fetchCategoryMovie(String slug, int page) async {
    return await _apiClient.get(
      '${ApiConstants.categoryMovie}$slug',
      queryParameters: {'page': page},
    );
  }

  // Fetch detail movie
  Future<Response> fetchDetail(String slug) async {
    return await _apiClient.get(
      '${ApiConstants.detailMovie}$slug',
    );
  } // Fetch movie by type

  Future<Response> fetchTypeMovie(String slug, int page) async {
    return await _apiClient.get(
      '${ApiConstants.movieByType}$slug',
      queryParameters: {'page': page},
    );
  }

  // Fetch movie by nation
  Future<Response> fetchNationMovie(String slug, int page) async {
    return await _apiClient.get(
      '${ApiConstants.movieByNation}$slug',
      queryParameters: {'page': page},
    );
  }

  // Fetch movie by time
  Future<Response> fetchMovieByTime(String slug, int page) async {
    return await _apiClient.get(
      '${ApiConstants.movieByTime}$slug',
      queryParameters: {'page': page},
    );
  }

  // Search movie
  Future<Response> searchMovie(String keyWord) async {
    return await _apiClient.get(
      ApiConstants.searchMovie,
      queryParameters: {'keyword': keyWord},
    );
  }
}
