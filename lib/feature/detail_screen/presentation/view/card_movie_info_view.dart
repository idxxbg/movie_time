import 'package:film_time/core/common/widget/read_more_text.dart';
import 'package:film_time/feature/detail_screen/presentation/bloc/detail_bloc/detail_bloc.dart';
import 'package:film_time/feature/detail_screen/presentation/bloc/detail_bloc/detail_state.dart';
import 'package:film_time/feature/detail_screen/presentation/widget/card_infor_shimmer_widget.dart';
import 'package:film_time/feature/detail_screen/presentation/widget/movie_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardMovieInfoView extends StatelessWidget {
  const CardMovieInfoView({super.key, required this.size, required this.theme});

  final Size size;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state is DetailLoaded) {
          final movie = state.movieDetail.movie!;
          return Container(
            width: size.width,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLowest,
              border: Border.all(color: Colors.black12, width: 1.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: const Text('Tổng số tập:'),
                  titleTextStyle: theme.textTheme.titleMedium,
                  trailing: CircleAvatar(
                    child: Text(movie.episodeTotal.toString()),
                  ),
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                  color: Colors.black12,
                  height: 0,
                ),
                MovieInfoTile(
                  title: 'Tập hiện tại:',
                  trailing: Text(
                    movie.episodeCurrent == null
                        ? 'Không xác định'
                        : movie.episodeCurrent.toString(),
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                MovieInfoTile(
                  title: 'Thời lượng:',
                  trailing: Text(
                    movie.time == null
                        ? 'Không xác định'
                        : movie.time.toString(),
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                MovieInfoTile(
                  title: 'Chất lượng:',
                  trailing: Text(
                    movie.quality == null
                        ? 'Không xác định'
                        : movie.quality.toString(),
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                  color: Colors.black12,
                  height: 0,
                ),
                MovieInfoTile(
                  title: 'Ngôn ngữ',
                  trailing: Text(
                    movie.lang == null
                        ? 'Không xác định'
                        : movie.lang.toString(),
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                MovieInfoTile(
                  title: 'Đạo diễn:',
                  trailing: Text(
                    movie.director == null
                        ? 'Không xác định'
                        : movie.director.toString(),
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: const Text('Diễn viên:'),
                  titleTextStyle: theme.textTheme.titleMedium,
                  subtitle: Text(movie.actor == null
                      ? 'Không xác định'
                      : movie.actor.toString()),
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                  color: Colors.black12,
                  height: 0,
                ),
                ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    title: const Text('Nội dung:'),
                    titleTextStyle: theme.textTheme.titleMedium,
                    subtitle: ReadMoreText(longText: movie.content.toString())),
              ],
            ),
          );
        }
        if (state is DetailLoading) {
          return CardInforShimmerWidget(size: size, theme: theme);
        }
        return CardInforShimmerWidget(size: size, theme: theme);
      },
    );
  }
}
