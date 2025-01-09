import 'package:film_time/feature/search_movie/domain/domain.dart';
import 'package:film_time/feature/search_movie/presentation/bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Cubit<SearchState> {
  final SearchMovieUseCase searchMovieUseCase;
  SearchBloc(this.searchMovieUseCase) : super(SearchInitial());

  Future<void> getListSearchMovie(String keyword, int limit) async {
    emit(SearchLoading());

    try {
      final listMovie = await searchMovieUseCase.searchMovie(keyword, limit);

      if (listMovie != null && listMovie.items.isNotEmpty) {
        emit(SearchLoaded(listMovie));
      } else {
        emit(SearchError('Không có phim nào khớp với từ khóa!'));
      }
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
