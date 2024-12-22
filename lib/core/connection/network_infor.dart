import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfor {
  Future<bool>? get isConnected;
}

class NetworkInforImpl implements NetworkInfor {
  final DataConnectionChecker dataConnectionChecker;
  NetworkInforImpl({required this.dataConnectionChecker});

  @override
  Future<bool>? get isConnected => dataConnectionChecker.hasConnection;
}
