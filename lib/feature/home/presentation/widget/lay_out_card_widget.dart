import 'package:film_time/feature/home/domain/entity/movie_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';

class LayOutCardWidget extends StatelessWidget {
  const LayOutCardWidget({super.key, required this.movie});
  final MovieInfoEntity movie;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        SoftEdgeBlur(
          edges: [
            EdgeBlur(
              tintColor: Colors.black12,
              type: EdgeType.bottomEdge,
              size: 110,
              sigma: 40,
              controlPoints: [
                ControlPoint(
                  position: 0.2,
                  type: ControlPointType.visible,
                ),
                ControlPoint(
                  position: 1,
                  type: ControlPointType.transparent,
                )
              ],
            )
          ],
          child: ClipRect(
            child: OverflowBox(
              minWidth: width * 6 / 8,
              maxWidth: width * 8 / 8,
              child: Image(
                fit: BoxFit.fitWidth,
                image: NetworkImage(
                  movie.thumbUrl.toString(),
                ),
              ),
            ),
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
              style: textTheme.titleMedium?.copyWith(color: Colors.white70),
            ),
            subtitle: Text(
              selectionColor: colorScheme.secondary,
              softWrap: false,
              overflow: TextOverflow.fade,
              '${movie.year}'.toString(),
              style: textTheme.bodySmall?.copyWith(color: Colors.white70),
            ),
          ),
        )
      ],
    );
  }
}
