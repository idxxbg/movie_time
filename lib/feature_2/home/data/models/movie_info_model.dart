import 'package:film_time/feature_2/home/domain/entity/movie_info_entity.dart';
import 'package:json_annotation/json_annotation.dart';

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
    this.year = 2001,
  });

  factory MovieInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MovieInfoModelFromJson(json);

  @override
  String toString() {
    return 'MovieInfoModel(name: $name )';
  }

  MovieInfoEntity toEnity() {
    return MovieInfoEntity(
      name: name,
      slug: slug,
      originName: originName,
      posterUrl: posterUrl,
      thumbUrl: thumbUrl,
    );
  }
}
