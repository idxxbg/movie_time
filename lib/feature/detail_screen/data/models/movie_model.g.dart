// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      tmdb: json['tmdb'] == null
          ? null
          : Tmdb.fromJson(json['tmdb'] as Map<String, dynamic>),
      status: json['status'] as String?,
      time: json['time'] as String?,
      episodeCurrent: json['episode_current'] as String?,
      episodeTotal: json['episode_total'] as String?,
      lang: json['lang'] as String?,
      quality: json['quality'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'tmdb': instance.tmdb,
      'content': instance.content,
      'status': instance.status,
      'time': instance.time,
      'episode_current': instance.episodeCurrent,
      'episode_total': instance.episodeTotal,
      'lang': instance.lang,
      'quality': instance.quality,
    };

Tmdb _$TmdbFromJson(Map<String, dynamic> json) => Tmdb(
      type: json['type'] as String?,
      id: json['id'] as String?,
      season: (json['season'] as num?)?.toInt(),
      voteAverage: (json['vote_average'] as num?)?.toInt(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TmdbToJson(Tmdb instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'season': instance.season,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
