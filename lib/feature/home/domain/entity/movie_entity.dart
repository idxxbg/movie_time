class MovieEntity {
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

  const MovieEntity({
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
}
