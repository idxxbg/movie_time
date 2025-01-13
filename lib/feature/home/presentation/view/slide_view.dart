import 'package:film_time/feature/home/presentation/bloc/home_state.dart';
import 'package:film_time/feature/home/presentation/bloc/new_movie_cubit/new_movie_cubit.dart';
import 'package:film_time/feature/home/presentation/widget/lay_out_card_widget.dart';
import 'package:film_time/util/routes/app_routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/injection/injection.dart';
import '../widget/slide_view_shimmer_widget.dart';

class SlideView extends StatelessWidget {
  const SlideView({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewMovieCubit(getListNewMovieUseCase: sl())..getNewMovie(1),
      child: BlocBuilder<NewMovieCubit, HomeState>(builder: (context, state) {
        if (state is HomeLoading) {
          return const SlideViewShimmerWidget();
        }
        if (state is HomeError) {
          return const Center(
            child: Text('data failed'),
          );
        }
        if (state is HomeLoaded) {
          final listMovies = state.listMovie.items;
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: height / 4),
            child: CarouselView.weighted(
              onTap: (value) => context.pushNamed(AppRoutesConstants.detail,
                  extra: listMovies[value]),
              controller: CarouselController(initialItem: 3),
              flexWeights: const [1, 7, 1],
              children: listMovies
                  .map((movie) => LayOutCardWidget(movie: movie))
                  .toList(),
            ),
          );
        }
        return const SlideViewShimmerWidget();
      }),
    );
  }
}
