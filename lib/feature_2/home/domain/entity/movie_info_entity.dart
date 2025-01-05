class MovieInfoEntity {
  final String? name;
  final String? slug;

  final String? originName;
  final String? posterUrl;
  final String? thumbUrl;
  final int? year;

  MovieInfoEntity({
    required this.name,
    required this.slug,
    required this.originName,
    required this.posterUrl,
    required this.thumbUrl,
    this.year = 2001,
  });
}
