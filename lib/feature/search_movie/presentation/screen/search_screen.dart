import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_time/core/common/style/style.dart';
import 'package:film_time/core/common/widget/error_screen.dart';
import 'package:film_time/feature/home/home.dart';
import 'package:film_time/feature/search_movie/presentation/presentation.dart';
import 'package:film_time/util/routes/app_routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final TextEditingController controller = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          centerTitle: true,
          title: Text(
            'Seach movie',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 28,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SearchBar(
                hintText: 'VD: Batman...',
                controller: controller,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    context.read<SearchBloc>().getListSearchMovie(value, 10);
                  }
                },
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return CardInfoMovieShimer(
                        size: size, theme: Theme.of(context));
                  }
                  if (state is SearchLoaded) {
                    final list = state.listMovie;
                    return Expanded(
                      child: ListView.builder(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: const EdgeInsets.only(top: 16),
                        itemCount: list.items.length,
                        itemBuilder: (context, i) {
                          final movie = list.items[i];
                          return CardInfoMovieWidget(
                            size: size,
                            movie: movie,
                          );
                        },
                      ),
                    );
                  } else if (state is SearchError) {
                    return ErrorScreen(error: ' ${state.error} has no data!');
                  } else {
                    return const ErrorScreen(error: 'Mời nhập tên phim');
                  }
                },
              ),
            ],
          ),
        ));
  }
}

class CardInfoMovieWidget extends StatelessWidget {
  const CardInfoMovieWidget({
    super.key,
    required this.size,
    required this.movie,
  });
  final Size size;
  final MovieInfoEntity movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 1 / 5,
      width: size.width,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.pushNamed(AppRoutesConstants.detail, extra: movie),
        child: Card.filled(
          color: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                    imageUrl: completeImageUrl(movie.posterUrl),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(movie.name.toString()),
                      titleTextStyle: Theme.of(context).textTheme.titleMedium,
                      subtitle: Text(
                          '${movie.quality.toString()} - ${movie.lang.toString()}\n${movie.time.toString()}'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardInfoMovieShimer extends StatelessWidget {
  const CardInfoMovieShimer(
      {super.key, required this.size, required this.theme});
  final Size size;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card.filled(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.primaryFixedDim,
          highlightColor: Theme.of(context).colorScheme.secondary,
          child: SizedBox(
            height: size.height * 1 / 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    height: size.height * 1 / 5,
                    width: 120,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.only(right: 16),
                        title: Container(
                          height: 10,
                          width: 1,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.grey,
                          ),
                        ),
                        subtitle: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 70,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
