import 'package:film_time/feature/detail_screen/domain/domain.dart';
import 'package:film_time/feature/detail_screen/presentation/bloc/detail_bloc/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailBloc extends Cubit<DetailState> {
  final GetMovieDetailUc getMovieDetailUc;
  DetailBloc({required this.getMovieDetailUc}) : super(DetailInitial());

  Future<void> getDetailMovie({required String slug, required}) async {
    emit(DetailLoading());
    try {
      final movieDetail = await getMovieDetailUc.call(slug);

      movieDetail != null
          ? emit(DetailLoaded(movieDetail))
          : emit(DetailError('Không có dử liệu'));
    } catch (e) {
      emit(DetailError(e.toString()));
    }
  }
}
