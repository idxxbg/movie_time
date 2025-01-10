import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';

class DetailMovieApi {
  final ApiClient _apiClient;

  DetailMovieApi(this._apiClient);
  // Fetch movie by type
  Future<Response> getDetailMovie(String slug) async {
    return await _apiClient.get(
      '${ApiConstants.detailMovie}/$slug',
    );
  }
}
