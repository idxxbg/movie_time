// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailModel _$MovieDetailModelFromJson(Map<String, dynamic> json) =>
    MovieDetailModel(
      movie: MovieModel.fromJson(json['movie'] as Map<String, dynamic>),
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => EpisodesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDetailModelToJson(MovieDetailModel instance) =>
    <String, dynamic>{
      'movie': instance.movie,
      'episodes': instance.episodes,
    };
