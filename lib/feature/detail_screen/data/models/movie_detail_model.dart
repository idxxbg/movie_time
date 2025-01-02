import 'package:film_time/core/data/models/movie_model.dart';
import 'package:film_time/feature/detail_screen/domain/domain.dart';

import '../../../../core/constants/constants.dart';

class MovieDetailModel {
  MovieModel? moviedetail;
  Categories? category;
  List<Episodes>? episodes;

  MovieDetailModel({
    required this.moviedetail,
    required this.category,
    required this.episodes,
  });
  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      moviedetail: MovieModel.fromJson(json),
      category: Categories.fromJson(json[kCatergory]),
      episodes: json[kEpisodes] != null
          ? (json[kEpisodes] as List<dynamic>)
              .map((episode) =>
                  Episodes.fromJson(episode as Map<String, dynamic>))
              .toList()
          : [],
    );
  }
  MovieDetailEntity toEntity(MovieDetailModel movieDetail) {
    return MovieDetailEntity(
      category: null,
      episodes:
          movieDetail.episodes!.map((episode) => episode.toEntity()).toList(),
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
      items: json[kItems] != null
          ? (json[kItems] as List<dynamic>)
              .map(
                (items) => Items.fromJson(items as Map<String, dynamic>),
              )
              .toList()
          : [],
    );
  }
  EpisodeEntity toEntity() {
    return EpisodeEntity(
      serverName: serverName,
      items: items!.map((items) => items.toEntity()).toList(),
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

  ItemsEntity toEntity() {
    return ItemsEntity(
      name: name,
      slug: slug,
      embed: embed,
      m3U8: m3u8,
    );
  }
}

// // import 'package:film_time/feature/detail_screen/domain/domain.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'movie_detail_model.g.dart';

// @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: true)
// class MovieDetailModel {
//   final Map<String, Category>? category;
//   final List<Episode>? episodes;

//   MovieDetailModel({
//     this.category,
//     this.episodes,
//   });

//   factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
//       _$MovieDetailModelFromJson(json);

//   Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);
// }

// @JsonSerializable()
// class Category {
//   final Group? group;
//   final List<Group>? list;

//   Category({
//     this.group,
//     this.list,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) =>
//       _$CategoryFromJson(json);

//   Map<String, dynamic> toJson() => _$CategoryToJson(this);
// }

// @JsonSerializable()
// class Group {
//   final String? id;
//   final String? name;

//   Group({
//     this.id,
//     this.name,
//   });

//   factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

//   Map<String, dynamic> toJson() => _$GroupToJson(this);
// }

// @JsonSerializable()
// class Episode {
//   final String? serverName;
//   final List<Item>? items;

//   Episode({
//     this.serverName,
//     this.items,
//   });

//   factory Episode.fromJson(Map<String, dynamic> json) =>
//       _$EpisodeFromJson(json);

//   Map<String, dynamic> toJson() => _$EpisodeToJson(this);
// }

// @JsonSerializable()
// class Item {
//   final String? name;
//   final String? slug;
//   final String? embed;
//   final String? m3U8;

//   Item({
//     this.name,
//     this.slug,
//     this.embed,
//     this.m3U8,
//   });

//   factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

//   Map<String, dynamic> toJson() => _$ItemToJson(this);
// }
