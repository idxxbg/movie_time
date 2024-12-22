import 'package:film_time/feature/home/presentation/bloc/home_bloc.dart';
import 'package:film_time/feature/home/presentation/bloc/home_state.dart';
import 'package:film_time/feature/home/presentation/widget/lay_out_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SlideView extends StatelessWidget {
  const SlideView({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is HomeError) {
        const Center(
          child: Text('data failed'),
        );
      }
      if (state is HomeLoaded) {
        final listMovies = state.list.listMovie!;
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height / 4),
          child: CarouselView.weighted(
            controller: CarouselController(initialItem: 1),
            itemSnapping: true,
            flexWeights: const [1, 7, 1],
            children: listMovies
                .map((movie) => LayOutCardWidget(movie: movie))
                .toList(),
          ),
        );
      }
      return const Center(
        child: Text('data'),
      );
    });
  }
}
