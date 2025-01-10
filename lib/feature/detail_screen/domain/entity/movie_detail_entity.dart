import 'package:film_time/feature/detail_screen/domain/domain.dart';

class MovieDetailEntity {
  final MovieEntity? movie;
  final List<EpisodesEntity>? episodes;

  MovieDetailEntity({
    this.movie,
    this.episodes,
  });
}

// class MovieDetailEntity {
//   final Map<String, CategoryEntity>? category;
//   final List<EpisodeEntity>? episodes;

//   MovieDetailEntity({
//     this.category,
//     this.episodes,
//   });
// }

// class CategoryEntity {
//   final GroupEntity? group;
//   final List<GroupEntity>? list;

//   CategoryEntity({
//     this.group,
//     this.list,
//   });
// }

// class GroupEntity {
//   final String? id;
//   final String? name;

//   GroupEntity({
//     this.id,
//     this.name,
//   });
// }

// class EpisodeEntity {
//   final String? serverName;
//   final List<ItemsEntity>? items;

//   EpisodeEntity({
//     this.serverName,
//     this.items,
//   });
// }

// class ItemsEntity {
//   final String? name;
//   final String? slug;
//   final String? embed;
//   final String? m3U8;

//   ItemsEntity({
//     this.name,
//     this.slug,
//     this.embed,
//     this.m3U8,
//   });
// }
