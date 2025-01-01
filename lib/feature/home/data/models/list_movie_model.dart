import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/list_movie_entity.dart';
import 'movie_model.dart';

part 'list_movie_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ListMovieModel {
  final List<MovieModel> items;

  ListMovieModel({required this.items});

  factory ListMovieModel.fromJson(Map<String, dynamic> json) =>
      _$ListMovieModelFromJson(json);
  ListMovieEntity toEntity(ListMovieModel movie) {
    return ListMovieEntity(
      items: movie.items.map((movie) => movie.toEntity()).toList(),
    );
  }
}
