import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:film_time/core/app/theme/app_theme.dart';
import 'package:film_time/feature/detail_screen/presentation/screens/movie_detail_screen.dart';
import 'package:film_time/feature/home/home.dart';
import 'package:film_time/feature/search_movie/search_movie.dart';
import 'package:film_time/feature/settings/bloc/theme_cubit/theme_cubit.dart';
import 'package:film_time/feature/settings/presentation/screens/settings_screens.dart';
import 'package:film_time/util/routes/app_routes_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';

import '../home/presentation/bloc/movie_by_category/movie_by_category_cubit.dart.dart';
import '../home/presentation/bloc/new_movie_cubit/new_movie_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final newMovieCubit = GetIt.I<NewMovieCubit>();
    final getCategoryMovies = GetIt.I<MovieByCategoryBloc>();
    final searchMovie = GetIt.I<SearchBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getCategoryMovies,
        ),
        BlocProvider(
          create: (context) => newMovieCubit,
        ),
        BlocProvider(
          create: (context) => searchMovie,
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Film Time',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state,
            routerConfig: router,
          );
        },
      ),
    );
  }
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: AppRoutesConstants.detail,
      path: '/detail',
      builder: (context, state) {
        final MovieInfoEntity movie = state.extra as MovieInfoEntity;
        return MovieDetailScreen(
          movie: movie,
        );
      },
    ),
    ShellRoute(
      routes: [
        GoRoute(
          name: AppRoutesConstants.home,
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: AppRoutesConstants.settings,
          path: '/settings',
          builder: (context, state) => const SettingsScreens(),
        ),
        GoRoute(
          name: AppRoutesConstants.search,
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
      ],
      builder: (BuildContext context, GoRouterState state, Widget child) {
        Map<int, Widget> children = {
          0: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.house_outlined,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Text(
                'Home',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              )
            ],
          ),
          1: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const Gap(5),
              Text(
                'Settings',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              )
            ],
          ),
        };
        return Scaffold(
          body: Stack(
            children: [
              child,
              Positioned(
                right: 0,
                left: 0,
                bottom: 16,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSlidingSegmentedControl<int>(
                        curve: Curves.easeInCirc,
                        initialValue: 0,
                        children: children,
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey.withOpacity(0.1),
                          // Theme.of(context).colorScheme.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        thumbDecoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(50)),
                        onValueChanged: (index) {
                          switch (index) {
                            case 0:
                              context.go(AppRoutesConstants.home);
                            case 1:
                              context.pushNamed(AppRoutesConstants.settings);
                          }
                        },
                      ).asGlass(clipBorderRadius: BorderRadius.circular(50)),
                      IconButton(
                        onPressed: () =>
                            context.pushNamed(AppRoutesConstants.search),
                        icon: CircleAvatar(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHigh,
                          child: const Icon(Icons.search),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  ],
);

// final GoRouter router = GoRouter(
//   routes: [
//     GoRoute(
//         name: AppRoutesConstants.detail,
//         path: '/detail',
//         builder: (context, state) {
//           final MovieInfoEntity movie = state.extra as MovieInfoEntity;
//           return MovieDetailScreen(
//             movie: movie,
//           );
//         }),
//     StatefulShellRoute.indexedStack(
//       builder: (context, state, shell) => MainApp(shell: shell),
//       branches: [
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               name: AppRoutesConstants.home,
//               path: '/',
//               builder: (context, state) => const HomeScreen(),
//             ),
//           ],
//         ),
//         StatefulShellBranch(routes: [
//           GoRoute(
//             name: AppRoutesConstants.settings,
//             path: '/settings',
//             builder: (context, state) => const SettingsScreens(),
//           ),
//         ]),
//         StatefulShellBranch(routes: [
//           GoRoute(
//             name: AppRoutesConstants.search,
//             path: '/search',
//             builder: (context, state) => const SearchScreen(),
//           ),
//         ]),
//       ],
//     ),
//   ],
// );
