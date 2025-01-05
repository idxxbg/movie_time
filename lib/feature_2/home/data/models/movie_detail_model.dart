// import 'package:film_time/feature_2/home/data/models/movie_info_model.dart';
// import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable(fieldRename: FieldRename.snake)
// class MovieDetailModel {
//   final List<MovieModel> movie;
//   final List<EpisodesModel> episodes;

//   MovieDetailModel({required this.movie, required this.episodes});

//   factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
//       _$MovieDetailModelFromJson(json);
// }

// class MovieModel {
//   final MovieInfoModel? movie;
//   final String? content;
//   final String? status;
//   final String? time;
//   final String? episodeCurrent;
//   final String? episodeTotal;
//   final String? lang;
//   final String? quality;
//   final List<String>? actor;
//   final List<String>? director;
//   MovieModel({
//     this.status,
//     this.time,
//     this.episodeCurrent,
//     this.episodeTotal,
//     this.lang,
//     this.quality,
//     this.movie,
//     this.content,
//     this.actor,
//     this.director,
//   });

//   factory MovieModel.fromJson(Map<String, dynamic> json) =>
//       _$MovieModelFromJson(json);
// }

// class EpisodesModel {
//   final String? severName;
//   final List<ServerDataModel>? serverData;

//   EpisodesModel({
//     this.severName,
//     this.serverData,
//   })
// }

// class ServerDataModel {}
