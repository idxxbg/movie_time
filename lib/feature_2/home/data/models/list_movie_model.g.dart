// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMovieModel _$ListMovieModelFromJson(Map<String, dynamic> json) =>
    ListMovieModel(
      (json['items'] as List<dynamic>)
          .map((e) => MovieInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListMovieModelToJson(ListMovieModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
