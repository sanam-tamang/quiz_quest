import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker {
  final Connectivity _connectivity;
  InternetChecker({required Connectivity connectivity})
      : _connectivity = connectivity;
  Future<bool> isConnected() async {
    final connectivityResult = await (_connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      //TODO:: I change true for now to work in local host enviroment even if there is no internet
      
      return true;
    } else {
      return true;
    }
  }
}
