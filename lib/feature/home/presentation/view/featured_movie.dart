import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_time/core/common/style/style.dart';
import 'package:film_time/feature/detail_screen/presentation/screens/movie_detail_screen.dart';
import 'package:film_time/feature/home/presentation/bloc/home_state.dart';
import 'package:film_time/feature/home/presentation/widget/featured_movie_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/injection/injection.dart';
import '../bloc/movie_by_category/movie_by_category_cubit.dart.dart';

class FeaturedMovie extends StatelessWidget {
  final String categoryType;
  final String endPoints;
  final String type;
  const FeaturedMovie({
    super.key,
    required this.categoryType,
    required this.endPoints,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) =>
          MovieByCategoryBloc(getListMovieByCategoryUseCase: sl())
            ..fetchMoviesByCategory(endPoints, 1),
      child: BlocBuilder<MovieByCategoryBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return FeaturedMovieShimmer(height: size.height);
          }
          if (state is HomeLoaded) {
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(categoryType),
                  titleTextStyle: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_rounded)),
                ),
                SizedBox(
                  height: size.height * 2 / 5.5,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, int i) => const Gap(16),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.listMovie.items.length,
                    itemBuilder: (context, int i) {
                      final movie = state.listMovie.items[i];
                      return SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        reverse: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            OpenContainer(
                              closedElevation: 0,
                              closedColor: theme.colorScheme.surface,
                              openColor: theme.colorScheme.surface,
                              middleColor: Colors.black.withOpacity(0.1),
                              openElevation: 0,
                              openShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              openBuilder: (context, closedContainer) {
                                // return Scaffold(appBar: AppBar());
                                return MovieDetailScreen(movie: movie);
                              },
                              closedBuilder: (context, openContainer) {
                                return SizedBox(
                                  height: size.height * 2 / 7,
                                  width: size.width * 1 / 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 50,
                                      ),
                                      fit: BoxFit.cover,
                                      imageUrl: completeImageUrl(
                                          movie.posterUrl.toString()),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const Gap(8),
                            SizedBox(
                              width: size.width * 1 / 3,
                              child: Text(
                                movie.name.toString(),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                style: theme.textTheme.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
          return FeaturedMovieShimmer(height: size.height);
        },
      ),
    );
  }
}
