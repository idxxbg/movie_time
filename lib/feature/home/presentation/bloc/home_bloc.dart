import 'package:film_time/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';

class HomeBloc extends Cubit<HomeState> {
  final GetListNewMovieUseCase getListNewMovieUseCase;
  final GetListMovieByCategoryUseCase getListMovieByCategoryUseCase;
  final GetListMovieByTypeUseCase getListMovieByTypeUseCase;
  HomeBloc({
    required this.getListNewMovieUseCase,
    required this.getListMovieByCategoryUseCase,
    required this.getListMovieByTypeUseCase,
  }) : super(HomeInitial());

  // Future<void> getNewMovie({
  //   required String type,
  //   String? slug,
  //   int page = 1,
  // }) async {
  //   emit(HomeLoading());
  //   try {
  //     final ListMovieEntity? listMovie;
  //     switch (type) {
  //       case 'new_movie':
  //         listMovie = await getListNewMovieUseCase.call(page);
  //       case 'by_category':
  //         slug == null
  //             ? throw Exception('slug is required!!!')
  //             : listMovie =
  //                 await getListMovieByCategoryUseCase.call(slug, page);
  //       case 'by_type':
  //         slug == null
  //             ? throw Exception('slug is required!!!')
  //             : listMovie = await getListMovieByTypeUseCase.call(slug, page);
  //       default:
  //         throw Exception('Invalid data type');
  //     }

  //     if (listMovie == null) {
  //       emit(HomeError('Khong có du lieu'));
  //     } else {
  //       emit(HomeLoaded(listMovie));
  //     }
  //   } catch (e) {
  //     emit(HomeError(e.toString()));
  //   }
  // }
}
