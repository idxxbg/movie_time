import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:film_time/core/connection/network_infor.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void getItsetup() {
  sl.registerLazySingleton<NetworkInfor>(
    () => NetworkInforImpl(dataConnectionChecker: DataConnectionChecker()),
  );
  // sl.registerSingleton<HomeBloc>(()=>);
}
