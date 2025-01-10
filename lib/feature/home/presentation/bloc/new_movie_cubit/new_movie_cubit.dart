import 'package:film_time/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

class NewMovieCubit extends Cubit<HomeState> {
  final GetListNewMovieUseCase getListNewMovieUseCase;
  NewMovieCubit({
    required this.getListNewMovieUseCase,
  }) : super(HomeInitial());

  Future<void> getNewMovie(int page) async {
    emit(HomeLoading());
    try {
      final ListMovieEntity? listMovie;

      listMovie = await getListNewMovieUseCase.call(page);

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
