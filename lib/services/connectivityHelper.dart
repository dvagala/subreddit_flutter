import 'dart:async';
import 'package:connectivity/connectivity.dart';

class ConnectivityHelper {
  ConnectivityHelper._privateConstructor();
  static final ConnectivityHelper instance =
      ConnectivityHelper._privateConstructor();

  StreamSubscription connectionChangedSubscription;
  ConnectivityResult previousConnection;

  void onConnectionAvailable(Null Function() callback) {
    connectionChangedSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none &&
          previousConnection == ConnectivityResult.none) {
        callback();
      }

      previousConnection = result;
    });
  }

  void dispose() {
    if (connectionChangedSubscription != null)
      connectionChangedSubscription.cancel();
  }
}
