import 'package:dio/dio.dart';
import 'package:film_time/core/connection/network_infor.dart';
import 'package:film_time/core/data/models/list_movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future<ListMovieModel?> fetchNewMovie(int page) async {
  final url = 'https://phim.nguonc.com/api/films/phim-moi-cap-nhat?page=$page';
  final networkInfor = GetIt.instance<NetworkInfor>();
  if (await networkInfor.isConnected == false) {
    debugPrintStack(label: 'No connection');
  } else {
    final dio = Dio();

    final response = await dio.get(url);
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final listMovie = ListMovieModel.fromJson(data);
        return listMovie;
      } else {
        debugPrint("error: ${response.statusCode}");
        // debugPrint("error: ${response.data}");
        throw Exception('fail to get data!');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  return null;
}
