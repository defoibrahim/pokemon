import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements INetworkInfo {
  NetworkInfoImpl();
  final dataConnectionChecker = GetIt.instance<InternetConnectionChecker>();
  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
