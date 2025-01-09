import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:film_time/core/connection/network_infor.dart';
import 'package:film_time/feature/detail_screen/data/data.dart';
import 'package:film_time/feature/detail_screen/domain/domain.dart';
import 'package:film_time/feature/detail_screen/presentation/bloc/detail_bloc/detail_bloc.dart';

import 'package:film_time/feature/home/presentation/bloc/new_movie_cubit/new_movie_cubit.dart';
import 'package:film_time/feature/search_movie/search_movie.dart';
import 'package:get_it/get_it.dart';

import '../../feature/home/data/data.dart';
import '../../feature/home/data/repositories/list_movie_reposioty_impl.dart';
import '../../feature/home/domain/domain.dart';
import '../../feature/home/presentation/bloc/home_bloc.dart';
import '../../feature/home/presentation/bloc/movie_by_category/movie_by_category_cubit.dart.dart';
import '../network/api_client.dart';

final sl = GetIt.instance;

void getItsetup() {
  sl.registerLazySingleton<NetworkInfor>(
    () => NetworkInforImpl(dataConnectionChecker: DataConnectionChecker()),
  );
  // 1. Đăng ký Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // 2. Đăng ký ApiClient
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));

  // 3. Đăng ký ListMovieApi
  sl.registerLazySingleton<ListMovieApi>(() => ListMovieApi(sl()));

  sl.registerLazySingleton<DetailMovieApi>(() => DetailMovieApi(sl()));

  sl.registerLazySingleton<SearchApi>(() => SearchApi(sl()));

  // 4. Đăng ký ListMovieRepositoryImpl
  sl.registerLazySingleton<ListMovieRepository>(
      () => ListMovieReposiotyImpl(sl())); // Repository triển khai interface

  sl.registerLazySingleton<MovieDetailRepo>(() => MovieDetailRepoImpl(sl()));

  sl.registerLazySingleton<SearchMovieRepo>(() => SearchMovieImpl(sl()));

  // 5. Đăng ký Usecase
  sl.registerLazySingleton<GetListNewMovieUseCase>(
      () => GetListNewMovieUseCase(sl()));

  sl.registerLazySingleton<GetListMovieByCategoryUseCase>(
      () => GetListMovieByCategoryUseCase(sl()));

  sl.registerLazySingleton<GetMovieDetailUc>(() => GetMovieDetailUc(sl()));

  sl.registerLazySingleton<SearchMovieUseCase>(() => SearchMovieUseCase(sl()));

  // 6. Đăng ký HomeBloc

  sl.registerFactory<NewMovieCubit>(
      () => NewMovieCubit(getListNewMovieUseCase: sl()));

  sl.registerFactory<MovieByCategoryBloc>(
      () => MovieByCategoryBloc(getListMovieByCategoryUseCase: sl()));

  sl.registerFactory<DetailBloc>(() => DetailBloc(getMovieDetailUc: sl()));

  sl.registerFactory<SearchBloc>(() => SearchBloc(sl()));
  // sl.registerFactory<HomeBloc>(() => HomeBloc(
  //       getListNewMovieUseCase: sl(),
  //       getListMovieByCategoryUseCase: sl(),
  //     ));
}
