import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mijoz_labbay/di/dependency_injection.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  InternetConnectionChecker dataConnectionChecker = di.get();

  NetworkInfoImpl({required this.dataConnectionChecker});

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
