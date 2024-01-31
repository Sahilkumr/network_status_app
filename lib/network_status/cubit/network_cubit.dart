import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStates { initial, connected, disconnected }

class NetworkCubit extends Cubit<NetworkStates> {
  final Connectivity _connection = Connectivity();
  StreamSubscription? connectionSubscription;

  NetworkCubit() : super(NetworkStates.initial) {
    connectionSubscription = _connection.onConnectivityChanged.listen(
      (result) {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          emit(NetworkStates.connected);
        } else {
          emit(NetworkStates.disconnected);
        }
      },
    );
  }

  @override
  Future<void> close() {
    connectionSubscription?.cancel();
    return super.close();
  }
}
