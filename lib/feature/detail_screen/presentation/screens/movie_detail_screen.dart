import 'package:film_time/core/injection/injection.dart';
import 'package:film_time/feature/detail_screen/presentation/bloc/detail_bloc/detail_bloc.dart';
import 'package:film_time/feature/detail_screen/presentation/bloc/detail_bloc/detail_state.dart';
import 'package:film_time/feature/detail_screen/presentation/widget/example_app_bar.dart';
import 'package:film_time/feature/detail_screen/presentation/widget/video_player_widget.dart';
import 'package:film_time/feature/home/domain/entity/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movie});
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
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

                    // Detail movie

                    _BuildInforMovie(size, theme),
                    const Gap(20),

                    // episode choice
                    EpisodeWidget(
                      size: size,
                      theme: theme,
                      slug: movie.slug.toString(),
                    ),

                    const Gap(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container _BuildInforMovie(Size size, ThemeData theme) {
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
              child: Text(movie.totalEpisodes.toString()),
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
              movie.currentEpisode == null
                  ? 'Không xác định'
                  : movie.currentEpisode.toString(),
              style: theme.textTheme.bodyMedium,
            ),
          ),
          MovieInfoTile(
            title: 'Thời lượng:',
            trailing: Text(
              movie.time == null ? 'Không xác định' : movie.time.toString(),
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
              movie.language == null
                  ? 'Không xác định'
                  : movie.language.toString(),
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
            subtitle: Text(movie.casts == null
                ? 'Không xác định'
                : movie.casts.toString()),
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
              subtitle: ReadMoreText(longText: movie.description.toString())

              //  Text(movie.description == null
              //     ? 'Không xác định'
              //     : movie.description.toString()),
              ),
        ],
      ),
    );
  }
}

class MovieInfoTile extends StatelessWidget {
  final String title;
  final Widget trailing;

  const MovieInfoTile({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          title: Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
          trailing: trailing,
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          color: Colors.black12,
          height: 0,
        ),
      ],
    );
  }
}

class EpisodeWidget extends StatelessWidget {
  const EpisodeWidget({
    super.key,
    required this.size,
    required this.theme,
    required this.slug,
  });

  final Size size;
  final ThemeData theme;
  final String slug;

  @override
  Widget build(BuildContext context) {
    bool _showMore = false;
    return BlocProvider(
      create: (context) =>
          DetailBloc(getMovieDetailUc: sl())..getDetailMovie(slug: slug),
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is DetailLoaded) {
              return ListView.separated(
                  separatorBuilder: (context, i) => const Gap(10),
                  shrinkWrap: true,
                  itemCount: state.movieDetail.episodes!.length,
                  itemBuilder: (context, int i) {
                    final ep = state.movieDetail.episodes![i];
                    return Container(
                      width: size.width,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest,
                        border: Border.all(color: Colors.black12, width: 1.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              setState(() {
                                _showMore = !_showMore;
                              });
                            },
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            title: Text(ep.serverName.toString()),
                            trailing: _showMore
                                ? const Icon(Icons.arrow_drop_up_outlined)
                                : const Icon(Icons.arrow_drop_down_outlined),
                          ),
                          Visibility(
                            visible: _showMore,
                            child: Center(
                              child: Wrap(
                                  children: List.generate(
                                ep.items!.length, // Số lượng phần tử
                                (i) => InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => VideoPlayerWidget(
                                          items: ep.items![i]),
                                    ),
                                  ),
                                  child: Card(
                                    shape: const CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        ep.items![i].name.toString(),
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    );
                    // Card(
                    // child: Text(ep.serverName.toString()),
                    // );
                  });
            }
            return const Center(child: LinearProgressIndicator());
          },
        );
      }),
    );
  }
}

// ignore: must_be_immutable
class ReadMoreText extends StatelessWidget {
  ReadMoreText({
    super.key,
    required this.longText,
  });

  final String longText;

  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Wrap(
        children: [
          Text(
            longText,
            // style: TextStyle(
            //   fontSize: 14,
            //   fontWeight: FontWeight.w400,
            //   color: Theme.of(context).primaryColor,
            // ),
            maxLines: readMore ? 1000 : 5,
            overflow: TextOverflow.fade,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                readMore = !readMore;
              });
            },
            child: Text(readMore ? 'Read less' : 'Read more'),
          ),
        ],
      );
    });
  }
}
