import 'package:dio/dio.dart';
import 'package:film_time/core/app/theme/app_theme.dart';
import 'package:film_time/core/network/api_client.dart';
import 'package:film_time/feature/home/data/data.dart';
import 'package:film_time/feature/home/data/repositories/list_movie_reposioty_impl.dart';

import 'package:film_time/feature/home/domain/usecases/get_list_movie_uc.dart';
import 'package:film_time/feature/home/presentation/bloc/home_bloc.dart';
import 'package:film_time/feature/home/presentation/bloc/new_movie_cubit/new_movie_cubit.dart';
import 'package:film_time/feature/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../home/presentation/bloc/movie_by_category/movie_by_category_cubit.dart.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final homeBloc = GetIt.I<HomeBloc>();
    final newMovieCubit = GetIt.I<NewMovieCubit>();
    final getCategoryMovies = GetIt.I<MovieByCategoryBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => homeBloc,
        ),
        BlocProvider(
          create: (context) => getCategoryMovies,
        ),
        BlocProvider(
          create: (context) => newMovieCubit,
        ),
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
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
