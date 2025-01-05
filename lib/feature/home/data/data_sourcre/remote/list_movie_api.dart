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
}
