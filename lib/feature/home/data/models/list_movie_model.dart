import 'package:json_annotation/json_annotation.dart';
import '../../domain/domain.dart';
import 'movie_info_model.dart';

part 'list_movie_model.g.dart';

@JsonSerializable()
class ListMovieModel {
  final List<MovieInfoModel> items;

  ListMovieModel(this.items);

  factory ListMovieModel.fromJson(Map<String, dynamic> json) {
    return _$ListMovieModelFromJson(json);
  }

  ListMovieEntity toEnity() {
    return ListMovieEntity(items.map((e) => e.toEntity()).toList());
  }
}

// class ListMovieModel {
//   final List<MovieModel> items;

//   ListMovieModel({required this.items});

//   factory ListMovieModel.fromJson(Map<String, dynamic> json) =>
//       _$ListMovieModelFromJson(json);
//   ListMovieEntity toEntity(ListMovieModel listMovie) {
//     return ListMovieEntity(
//       items: listMovie.items.map((movie) => movie.toEntity()).toList(),
//     );
//   }
// }
