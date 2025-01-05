import 'package:film_time/feature_2/home/data/models/movie_info_model.dart';
import 'package:film_time/feature_2/home/domain/entity/list_movie_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_movie_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ListMovieModel {
  final List<MovieInfoModel> items;

  ListMovieModel(this.items);

  factory ListMovieModel.fromJson(Map<String, dynamic> json) {
    return _$ListMovieModelFromJson(json);
  }

  ListMovieEntity toEnity(ListMovieModel listMovie) {
    return ListMovieEntity(listMovie.items.map((e) => e.toEnity()).toList());
  }
}
