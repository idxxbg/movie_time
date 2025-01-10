// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerDataModel _$ServerDataModelFromJson(Map<String, dynamic> json) =>
    ServerDataModel(
      json['filename'] as String?,
      json['name'] as String?,
      json['slug'] as String?,
      json['link_embed'] as String?,
      json['link_m3u8'] as String?,
    );

Map<String, dynamic> _$ServerDataModelToJson(ServerDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'filename': instance.filename,
      'link_embed': instance.linkEmbed,
      'link_m3u8': instance.linkM3u8,
    };
