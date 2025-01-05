// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieInfoModel _$MovieInfoModelFromJson(Map<String, dynamic> json) =>
    MovieInfoModel(
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      originName: json['origin_name'] as String?,
      posterUrl: json['poster_url'] as String?,
      thumbUrl: json['thumb_url'] as String?,
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieInfoModelToJson(MovieInfoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'origin_name': instance.originName,
      'poster_url': instance.posterUrl,
      'thumb_url': instance.thumbUrl,
      'year': instance.year,
    };
