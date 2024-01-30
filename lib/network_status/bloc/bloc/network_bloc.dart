import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'network_event.dart';
part 'network_state.dart';

// Connectivity _connection = Connectivity();
var isconnected = false;
StreamSubscription? connectionSubscription;

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(NetworkInitial()) {
    on<NetworkConnectedEvent>((event, emit) { emit(NetworkConnectedState());});
    on<NetworkDisconnectedEvent>((event, emit) { emit(NetworkDisconnectedState());});

    connectionSubscription = Connectivity().onConnectivityChanged.listen(
      (result)async {
        isconnected = await InternetConnectionChecker().hasConnection;
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi && isconnected) {
          add(NetworkConnectedEvent());
        } else {
          add(NetworkDisconnectedEvent());
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
