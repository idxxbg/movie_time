import 'package:dio/dio.dart';
import 'package:film_time/core/constants/api_constants.dart';
import 'package:film_time/core/constants/end_points.dart';

import '../api/app_api.dart';

class ListMovieApi2 {
  final AppApi api;
  ListMovieApi2(this.api);

  // Fetch new movie
  Future<Response> fetchNewMovie(int page) async {
    return await api.get(
      ApiConstants.newMovie2,
      queryParameters: {'page': page},
    );
  }

  // Fetch new movie by type
  Future<Response> fetchMoviebyType(EndPoints slug, int page) async {
    return await api.get(
      '${ApiConstants.type}$slug',
      queryParameters: {'page': page},
    );
  }
}
