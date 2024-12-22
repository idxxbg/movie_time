import '../../constants/constants.dart';

class MovieModel {
  String? name;
  String? slug;
  String? originalName;
  String? thumbUrl;
  String? posterUrl;
  String? created;
  String? modified;
  String? description;
  int? totalEpisodes;
  String? currentEpisode;
  String? time;
  String? quality;
  String? language;
  String? director;
  String? casts;
  MovieModel({
    required this.name,
    required this.slug,
    required this.originalName,
    required this.thumbUrl,
    required this.posterUrl,
    required this.created,
    required this.modified,
    required this.description,
    required this.totalEpisodes,
    required this.currentEpisode,
    required this.time,
    required this.quality,
    required this.language,
    required this.director,
    required this.casts,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      name: json[kName],
      slug: json[kSlug],
      originalName: json[kOriginalname],
      thumbUrl: json[kThumburl],
      posterUrl: json[kPosterurl],
      created: json[kCreated],
      modified: json[kModified],
      description: json[kDescription],
      totalEpisodes: json[kTotalepisodes],
      currentEpisode: json[kCurrentepisode],
      time: json[kTime],
      quality: json[kQuality],
      language: json[kLanguage],
      director: json[kDirector],
      casts: json[kCasts],
    );
  }
}
