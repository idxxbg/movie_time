import 'package:film_time/core/injection/injection.dart';
import 'package:film_time/feature/detail_screen/presentation/bloc/detail_bloc/detail_bloc.dart';
import 'package:film_time/feature/detail_screen/presentation/bloc/detail_bloc/detail_state.dart';
import 'package:film_time/feature/detail_screen/presentation/view/card_movie_info_view.dart';
import 'package:film_time/feature/detail_screen/presentation/view/episode_view.dart';
import 'package:film_time/feature/detail_screen/presentation/widget/card_infor_shimmer_widget.dart';
import 'package:film_time/feature/detail_screen/presentation/widget/episode_shimmer_widget.dart';
import 'package:film_time/feature/detail_screen/presentation/widget/example_app_bar.dart';
import 'package:film_time/feature/detail_screen/presentation/widget/video_player_widget.dart';
import 'package:film_time/feature/home/domain/entity/movie_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movie});
  final MovieInfoEntity movie;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => DetailBloc(getMovieDetailUc: sl())
        ..getDetailMovie(slug: movie.slug.toString()),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: ExampleAppBar(movie),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      Text(
                        movie.name.toString(),
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Gap(20),

                      // episode choice
                      EpisodeView(
                        size: size,
                        theme: theme,
                        slug: movie.slug.toString(),
                      ),
                      const Gap(20),

                      // Detail movie
                      CardMovieInfoView(size: size, theme: theme),
                      // _BuildInforMovie(size, theme),
                      const Gap(20),

                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
