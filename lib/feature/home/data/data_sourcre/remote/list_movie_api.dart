import 'package:dio/dio.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/network/api_client.dart';

class ListMovieApi {
  final ApiClient _apiClient;

  ListMovieApi(this._apiClient);

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

  // Fetch movie by type
  Future<Response> fetchTypeMovie(String slug, int page) async {
    return await _apiClient.get(
      '${ApiConstants.movieByType}$slug',
      queryParameters: {'page': page},
    );
  }

  // Fetch detail movie
  Future<Response> fetchDetail(String slug) async {
    return await _apiClient.get(
      '${ApiConstants.detailMovie}$slug',
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
}
