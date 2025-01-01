import 'package:film_time/feature/home/presentation/bloc/new_movie_cubit/new_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../home_state.dart';

class MovieByCategoryBloc extends Cubit<HomeState> {
  final GetListMovieByCategoryUseCase getListMovieByCategoryUseCase;

  MovieByCategoryBloc({required this.getListMovieByCategoryUseCase})
      : super(HomeInitial());

  Future<void> fetchMoviesByCategory(String slug, int page) async {
    emit(HomeLoading());
    try {
      final movies = await getListMovieByCategoryUseCase.call(slug, page);
      if (movies != null) {
        emit(HomeLoaded(movies));
      } else {
        emit(HomeError('Không có dữ liệu'));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
