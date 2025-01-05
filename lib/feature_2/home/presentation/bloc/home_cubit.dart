import 'package:film_time/feature_2/home/domain/entity/list_movie_entity.dart';
import 'package:film_time/feature_2/home/domain/usecase/get_list_movie_uc.dart';
import 'package:film_time/feature_2/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  GetListNewMovieUseCase2 get;

  HomeCubit({required this.get}) : super(HomeInitial());

  Future<void> getListNewMovie(int page) async {
    emit(HomeLoading());
    try {
      late final ListMovieEntity? listMovie;
      listMovie = await get.call(page);
      if (listMovie != null) {
        emit(HomeLoader(listMovie));
      } else {
        emit(HomeError('Failed to get movie'));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
