import 'package:film_time/feature/detail_screen/presentation/bloc/detail_bloc/detail_bloc.dart';
import 'package:film_time/feature/detail_screen/presentation/bloc/detail_bloc/detail_state.dart';
import 'package:film_time/feature/detail_screen/presentation/widget/episode_shimmer_widget.dart';
import 'package:film_time/feature/detail_screen/presentation/widget/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EpisodeView extends StatelessWidget {
  const EpisodeView({
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
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is DetailLoaded) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              separatorBuilder: (context, i) => const Gap(16),
              shrinkWrap: true,
              itemCount: state.movieDetail.episodes!.length,
              itemBuilder: (context, int i) {
                final ep = state.movieDetail.episodes![i];
                return Container(
                  width: size.width,
                  // padding: const EdgeInsets.all(5),
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
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: size.height * 0.25),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Wrap(
                              spacing: 5.0, // Khoảng cách ngang giữa các ô
                              runSpacing: 5.0, // Khoảng cách dọc giữa các ô
                              children: ep.serverData!
                                  .map(
                                    (data) => InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      onTap: () {
                                        // onEpisodeSelected(data);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                VideoPlayerWidget(data: data),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        child: SizedBox(
                                          width: (size.width - 40) /
                                              5, // Chia đều cho 5 cột
                                          height: (size.width - 40) /
                                              10, // Aspect ratio là 1:1
                                          child: Center(
                                            child: Text(data.name.toString()),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          if (state is DetailLoading) {
            return EpisodeShimmerWidget(size: size, theme: theme);
          }
          return EpisodeShimmerWidget(size: size, theme: theme);
        },
      );
    });
  }
}
