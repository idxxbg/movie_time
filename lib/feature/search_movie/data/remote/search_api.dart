import 'package:dio/dio.dart';
import 'package:film_time/core/constants/api_constants.dart';
import 'package:film_time/core/network/api_client.dart';

class SearchApi {
  ApiClient api;

  SearchApi(this.api);

  Future<Response> fetchSearchMovie(String keyword, int limit) async {
    return await api.get(
      ApiConstants.searchMovie,
      queryParameters: {'keyword': keyword, 'limit': limit},
    );
  }
}
