import 'package:film_time/feature/detail_screen/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieModel {
  final Tmdb? tmdb;
  final String? content;
  final String? status;
  final String? time;
  final String? episodeCurrent;
  final String? episodeTotal;
  final String? lang;
  final String? quality;
  final List<String>? actor;
  final List<String>? director;
  MovieModel({
    this.tmdb,
    this.status,
    this.time,
    this.episodeCurrent,
    this.episodeTotal,
    this.lang,
    this.quality,
    this.content,
    this.actor,
    this.director,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  MovieEntity toEntity() {
    return MovieEntity(
      tmdb: tmdb!.toEntity(),
      status: status,
      time: time,
      episodeCurrent: episodeCurrent,
      episodeTotal: episodeTotal,
      lang: lang,
      quality: quality,
      content: content,
      actor: actor,
      director: director,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Tmdb {
  final String? type;
  final String? id;
  final int? season;
  final int? voteAverage;
  final int? voteCount;

  Tmdb({
    this.type,
    this.id,
    this.season,
    this.voteAverage,
    this.voteCount,
  });

  factory Tmdb.fromJson(Map<String, dynamic> json) => _$TmdbFromJson(json);

  TmdbEntity toEntity() {
    return TmdbEntity(
      type: type,
      id: id,
      season: season,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
