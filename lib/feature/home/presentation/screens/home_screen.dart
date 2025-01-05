import 'package:film_time/core/constants/end_points.dart';
import 'package:film_time/feature/home/presentation/view/featured_movie.dart';
import 'package:film_time/feature/home/presentation/view/slide_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('NetFilm'),
            titleTextStyle: theme.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          // New movie update
          SlideView(height: height),
          const Gap(10),
          // category movie

          const FeaturedMovie(
            type: 'by_category',
            categoryType: 'Phim bộ',
            endPoints: EndPoints.drama,
          ),

          const FeaturedMovie(
            type: 'by_category',
            categoryType: 'Phim Hoạt Hình',
            endPoints: EndPoints.cartoon,
          ),

          const FeaturedMovie(
            type: 'by_category',
            categoryType: 'Phim lẻ',
            endPoints: EndPoints.movie,
          ),

          const FeaturedMovie(
            type: 'by_category',
            categoryType: 'Phim tvShows',
            endPoints: EndPoints.tvShows,
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
