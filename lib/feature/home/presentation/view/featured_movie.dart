import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_time/feature/home/presentation/bloc/home_state.dart';
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.height * 2 / 7,
                                width: size.width * 1 / 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: movie.thumbUrl.toString(),
                                    // 'https://phim.nguonc.com/public/images/Film/tKV0etz5OIsAjSNG1hJktsjbNJk.jpg'
                                    // "https://phim.nguonc.com/public/images/Film/3gamjZzJrZpqsdpz8yJWjD54PoX.jpg",
                                  ),
                                ),
                              ),
                              const Gap(16),
                              SizedBox(
                                width: size.width * 1 / 3,
                                child: Text(
                                  movie.name.toString(),
                                  textAlign: TextAlign.center,
                                  // maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: theme.textTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
