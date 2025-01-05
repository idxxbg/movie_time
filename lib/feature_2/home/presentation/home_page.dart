import 'package:film_time/core/injection/injection.dart';
import 'package:film_time/feature_2/home/presentation/bloc/home_cubit.dart';
import 'package:film_time/feature_2/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = GetIt.I<HomeCubit>();
    return BlocProvider(
      create: (context) => HomeCubit(get: sl())..getListNewMovie(1),
      child: MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoader) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.listMovie.items.length,
                          itemBuilder: (context, int i) {
                            final movie = state.listMovie.items[i];
                            return Text(movie.posterUrl.toString());
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
