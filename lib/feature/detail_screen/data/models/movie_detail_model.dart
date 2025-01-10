import 'package:film_time/feature/detail_screen/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../data.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailModel {
  final MovieModel movie;

  final List<EpisodesModel> episodes;

  MovieDetailModel({
    required this.movie,
    required this.episodes,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  MovieDetailEntity toEntity() {
    return MovieDetailEntity(
      movie: movie.toEntity(),
      episodes: episodes.map((e) => e.toEntity()).toList(),
    );
  }
}
