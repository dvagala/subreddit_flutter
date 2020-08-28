import 'dart:async';
import 'package:connectivity/connectivity.dart';

class ConnectivityHelper {
  ConnectivityHelper._privateConstructor();
  static final ConnectivityHelper instance =
      ConnectivityHelper._privateConstructor();

  StreamSubscription connectionChangedSubscription;
  ConnectivityResult previousConnection;

  void onConnectionAvailable(Null Function() callback) {
    // When the app is loaded onConnectivityChanged is fired, so skip first event
    // from the stream. This is probably not optimal solution.
    connectionChangedSubscription = Connectivity()
        .onConnectivityChanged
        .skip(1)
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
