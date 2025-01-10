import 'package:film_time/core/app/theme/app_theme.dart';
import 'package:film_time/feature/home/presentation/screens/home_screen.dart';
import 'package:film_time/feature/search_movie/presentation/screen/search_screen.dart';
import 'package:film_time/feature/search_movie/search_movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Film Time',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: const MainApp(),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title:
            Text('Film Time', style: Theme.of(context).textTheme.headlineLarge),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (_) => const SearchScreen()));
              },
              icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
