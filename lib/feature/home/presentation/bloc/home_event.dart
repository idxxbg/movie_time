import 'package:equatable/equatable.dart';
import 'package:film_time/feature/home/domain/usecases/get_list_movie_uc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class HomeFetchNewMovie extends HomeEvent {
  GetListNewMovieUseCase getNewMovieUseCase;
  HomeFetchNewMovie(this.getNewMovieUseCase);
  @override
  List<Object?> get props => [getNewMovieUseCase];
}
