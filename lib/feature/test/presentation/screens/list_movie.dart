import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_time/feature/test/domain/entity/list_movie_model.dart';
import 'package:flutter/material.dart';

class ListMovie extends StatelessWidget {
  const ListMovie({super.key, required this.list, required this.text});

  final String text;
  final ListMovieModel list;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 250, maxHeight: 300),
        child: Column(
          children: [
            ListTile(
              title: Text(text),
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: list.listMovie!.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = list.listMovie![index];
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: movie.thumbUrl.toString(),
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      movie.name.toString(),
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                );
              },
            ),
          ],
        ));
  }
}
