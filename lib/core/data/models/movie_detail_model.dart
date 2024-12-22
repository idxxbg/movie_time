import 'package:film_time/core/data/models/movie_model.dart';

import '../../constants/constants.dart';

class MovieDetailModel {
  String? id;
  MovieModel? moviedetail;
  Categories? category;
  List<Episodes> episodes;

  MovieDetailModel({
    required this.id,
    required this.moviedetail,
    required this.category,
    required this.episodes,
  });
  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json[kId],
      moviedetail: MovieModel.fromJson(json),
      category: Categories.fromJson(json[kCatergory]),
      episodes: (json[kEpisodes] as List<dynamic>)
          .map((episode) => Episodes.fromJson(episode as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Categories {
  Category? c1;
  Category? c2;
  Category? c3;
  Category? c4;
  Categories({
    required this.c1,
    required this.c2,
    required this.c3,
    required this.c4,
  });
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      c1: Category.fromJson(json['1']),
      c2: Category.fromJson(json['2']),
      c3: Category.fromJson(json['3']),
      c4: Category.fromJson(json['4']),
    );
  }
}

class Category {
  final Group? group;
  final List<Group>? list;
  Category({required this.group, required this.list});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      group: Group.fromJson(json[kGroup]),
      list: (json[kList] as List<dynamic>)
          .map((item) => Group.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Group {
  final String? id;
  final String? name;
  Group({required this.id, required this.name});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(id: json[kId], name: json[kName]);
  }
}

class Episodes {
  final String? serverName;
  final List<Items>? items;
  Episodes({required this.serverName, required this.items});

  factory Episodes.fromJson(Map<String, dynamic> json) {
    return Episodes(
      serverName: json[kServername],
      items: (json[kItems] as List<dynamic>)
          .map(
            (items) => Items.fromJson(items as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class Items {
  final String? name;
  final String? slug;
  final String? embed;
  final String? m3u8;
  Items(
      {required this.name,
      required this.slug,
      required this.embed,
      required this.m3u8});
  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      name: json[kName],
      slug: json[kSlug],
      embed: json[kEmbed],
      m3u8: json[kM3u8],
    );
  }
}
