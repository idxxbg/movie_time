class MovieEntity {
  final TmdbEntity? tmdb;
  final String? content;
  final String? status;
  final String? time;
  final String? episodeCurrent;
  final String? episodeTotal;
  final String? lang;
  final String? quality;
  final List<String>? actor;
  final List<String>? director;
  MovieEntity({
    this.tmdb,
    this.status,
    this.time,
    this.episodeCurrent,
    this.episodeTotal,
    this.lang,
    this.quality,
    this.content,
    this.actor,
    this.director,
  });
}

class TmdbEntity {
  final String? type;
  final String? id;
  final int? season;
  final int? voteAverage;
  final int? voteCount;

  TmdbEntity({
    this.type,
    this.id,
    this.season,
    this.voteAverage,
    this.voteCount,
  });
}
