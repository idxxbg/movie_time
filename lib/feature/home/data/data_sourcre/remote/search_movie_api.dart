import 'package:dio/dio.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/network/api_client.dart';

class SearchMovieApi {
  final ApiClient _apiClient;

  SearchMovieApi(this._apiClient);
  // Search movie
  Future<Response> searchMovie(String keyWord) async {
    return await _apiClient.get(
      ApiConstants.searchMovie,
      queryParameters: {'keyword': keyWord},
    );
  }
}
