import 'package:film_time/feature/home/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

// import '../../../../core/constants/constants.dart';

part 'movie_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieInfoModel {
  final String? name;
  final String? slug;
  final String? originName;
  final String? posterUrl;
  final String? thumbUrl;
  final int? year;

  MovieInfoModel({
    required this.name,
    required this.slug,
    required this.originName,
    required this.posterUrl,
    required this.thumbUrl,
    this.year,
  });

  factory MovieInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MovieInfoModelFromJson(json);

  @override
  String toString() {
    return 'MovieInfoModel(name: $name )';
  }

  MovieInfoEntity toEntity() {
    return MovieInfoEntity(
      name: name,
      slug: slug,
      originName: originName,
      posterUrl: posterUrl,
      thumbUrl: thumbUrl,
      year: year,
    );
  }
}

// class MovieModel {
//   final String? name;
//   final String? slug;
//   final String? originalName;
//   final String? thumbUrl;
//   final String? posterUrl;
//   final String? created;
//   final String? modified;
//   final String? description;
//   final int totalEpisodes;
//   final String? currentEpisode;
//   final String? time;
//   final String? quality;
//   final String? language;
//   final String? director;
//   final String? casts;
//   const MovieModel(
//     this.name,
//     this.slug,
//     this.originalName,
//     this.thumbUrl,
//     this.posterUrl,
//     this.created,
//     this.modified,
//     this.description,
//     this.totalEpisodes,
//     this.currentEpisode,
//     this.time,
//     this.quality,
//     this.language,
//     this.director,
//     this.casts,
//   );
//   factory MovieModel.fromJson(Map<String, dynamic> json) =>
//       _$MovieModelFromJson(json);

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
