// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      json['name'] as String?,
      json['slug'] as String?,
      json['original_name'] as String?,
      json['thumb_url'] as String?,
      json['poster_url'] as String?,
      json['created'] as String?,
      json['modified'] as String?,
      json['description'] as String?,
      (json['total_episodes'] as num).toInt(),
      json['current_episode'] as String?,
      json['time'] as String?,
      json['quality'] as String?,
      json['language'] as String?,
      json['director'] as String?,
      json['casts'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.slug case final value?) 'slug': value,
      if (instance.originalName case final value?) 'original_name': value,
      if (instance.thumbUrl case final value?) 'thumb_url': value,
      if (instance.posterUrl case final value?) 'poster_url': value,
      if (instance.created case final value?) 'created': value,
      if (instance.modified case final value?) 'modified': value,
      if (instance.description case final value?) 'description': value,
      'total_episodes': instance.totalEpisodes,
      if (instance.currentEpisode case final value?) 'current_episode': value,
      if (instance.time case final value?) 'time': value,
      if (instance.quality case final value?) 'quality': value,
      if (instance.language case final value?) 'language': value,
      if (instance.director case final value?) 'director': value,
      if (instance.casts case final value?) 'casts': value,
    };
