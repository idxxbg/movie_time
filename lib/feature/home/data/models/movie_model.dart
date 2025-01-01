// import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

// import '../../../../core/constants/constants.dart';
import '../../domain/entity/movie_entity.dart';

part 'movie_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MovieModel {
  final String? name;
  final String? slug;
  final String? originalName;
  final String? thumbUrl;
  final String? posterUrl;
  final String? created;
  final String? modified;
  final String? description;
  final int totalEpisodes;
  final String? currentEpisode;
  final String? time;
  final String? quality;
  final String? language;
  final String? director;
  final String? casts;
  const MovieModel(
    this.name,
    this.slug,
    this.originalName,
    this.thumbUrl,
    this.posterUrl,
    this.created,
    this.modified,
    this.description,
    this.totalEpisodes,
    this.currentEpisode,
    this.time,
    this.quality,
    this.language,
    this.director,
    this.casts,
  );
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  // Chuyển đổi từ MovieModel sang MovieEntity
  MovieEntity toEntity() {
    return MovieEntity(
      name: name,
      slug: slug,
      originalName: originalName,
      thumbUrl: thumbUrl,
      posterUrl: posterUrl,
      created: created,
      modified: modified,
      description: description,
      totalEpisodes: totalEpisodes,
      currentEpisode: currentEpisode,
      time: time,
      quality: quality,
      language: language,
      director: director,
      casts: casts,
    );
  }
}

// class MovieModel {
//   final String name;
//   final String slug;
//   final String originalName;
//   final String thumbUrl;
//   final String posterUrl;
//   final String created;
//   final String modified;
//   final String description;
//   final int totalEpisodes;
//   final String currentEpisode;
//   final String time;
//   final String quality;
//   final String language;
//   final String director;
//   final String casts;

//   const MovieModel({
//     required this.name,
//     required this.slug,
//     required this.originalName,
//     required this.thumbUrl,
//     required this.posterUrl,
//     required this.created,
//     required this.modified,
//     required this.description,
//     required this.totalEpisodes,
//     required this.currentEpisode,
//     required this.time,
//     required this.quality,
//     required this.language,
//     required this.director,
//     required this.casts,
//   });
//   factory MovieModel.fromJson(Map<String, dynamic> json) {
//     return MovieModel(
//       name: json['name'],
//       slug: json['slug'],
//       originalName: json['original_name'],
//       thumbUrl: json['thumb_url'],
//       posterUrl: json['poster_url'],
//       created: json['created'],
//       modified: json['modified'],
//       description: json['description'],
//       totalEpisodes: json['total_episodes'],
//       currentEpisode: json['current_episode'],
//       time: json['time'],
//       quality: json['quality'],
//       language: json['language'],
//       director: json['director'],
//       casts: json['casts'],
//     );
//   }

//   // Chuyển đổi từ MovieModel sang MovieEntity
//   MovieEntity toEntity() {
//     return MovieEntity(
//       name: name,
//       slug: slug,
//       originalName: originalName,
//       thumbUrl: thumbUrl,
//       posterUrl: posterUrl,
//       created: created,
//       modified: modified,
//       description: description,
//       totalEpisodes: totalEpisodes,
//       currentEpisode: currentEpisode,
//       time: time,
//       quality: quality,
//       language: language,
//       director: director,
//       casts: casts,
//     );
//   }
// }
