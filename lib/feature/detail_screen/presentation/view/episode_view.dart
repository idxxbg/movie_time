import 'package:film_time/feature/detail_screen/presentation/bloc/detail_bloc/detail_bloc.dart';
import 'package:film_time/feature/detail_screen/presentation/bloc/detail_bloc/detail_state.dart';
import 'package:film_time/feature/detail_screen/presentation/widget/episode_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass/glass.dart';
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
                        child: SizedBox(
                          height: size.height * 0.3,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              childAspectRatio: 1, // Aspect ratio of each item
                            ),
                            itemCount: ep.serverData!.length,
                            itemBuilder: (context, index) {
                              final name = ep.serverData![index].name;
                              return Container(
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(name.toString()),
                                ),
                              ).asGlass();
                            },
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
