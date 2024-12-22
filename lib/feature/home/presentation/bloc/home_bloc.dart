import 'package:film_time/core/data/api/get_new_movie.dart';
import 'package:film_time/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeInitial());

  Future<void> getNewMovie(int page) async {
    emit(HomeLoading());
    try {
      final listMovie = await fetchNewMovie(page);
      if (listMovie == null) {
        emit(HomeError('Khong có du lieu'));
      } else {
        emit(HomeLoaded(listMovie));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
