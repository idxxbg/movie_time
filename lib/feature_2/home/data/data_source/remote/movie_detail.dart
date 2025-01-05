import 'package:dio/dio.dart';
import 'package:film_time/core/constants/api_constants.dart';
import 'package:film_time/feature_2/home/data/data_source/api/app_api.dart';

class MovieDetail {
  final AppApi api;
  MovieDetail(this.api);
  // Fetch movie detail
  Future<Response> fetchMovieDetail(String slug) {
    return api.get('${ApiConstants.detailMovie2}/$slug');
  }
}
