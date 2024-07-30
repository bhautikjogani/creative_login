import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService {
  bool hasConnection = false;

  InternetService._();

  static Future<InternetService> initialize() async {
    InternetService instance = InternetService._();
    final connectivity = Connectivity();
    var result = await connectivity.checkConnectivity();
    instance.hasConnection = result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
    connectivity.onConnectivityChanged.listen(instance._onConnectivityChange);
    return instance;
  }

  void _onConnectivityChange(ConnectivityResult result) {
    hasConnection = result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }
}
