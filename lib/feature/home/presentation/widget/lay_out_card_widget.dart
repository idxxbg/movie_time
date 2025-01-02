// import 'package:film_time/feature/home/data/models/list_movie_model.dart';
import 'package:film_time/feature/home/domain/entity/movie_entity.dart';
import 'package:flutter/material.dart';

class LayOutCardWidget extends StatelessWidget {
  const LayOutCardWidget({super.key, required this.movie});
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        ClipRect(
          child: OverflowBox(
            minWidth: width * 6 / 8,
            maxWidth: width * 8 / 8,
            child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(movie.posterUrl.toString())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            textColor: colorScheme.surface,
            title: Text(
              softWrap: false,
              overflow: TextOverflow.fade,
              movie.name.toString(),
              style: textTheme.titleMedium,
            ),
            subtitle: Text(
              selectionColor: colorScheme.secondary,
              softWrap: false,
              overflow: TextOverflow.fade,
              '${movie.time} - ${movie.currentEpisode} \n ${movie.language} '
                  .toString(),
              style: textTheme.bodySmall,
            ),
          ),
        )
      ],
    );
  }
}
