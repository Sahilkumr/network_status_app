import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_status_app/network_status/bloc/bloc/network_bloc.dart';

class NetworkHome extends StatelessWidget {
  const NetworkHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Connection Status',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          BlocBuilder<NetworkBloc, NetworkState>(
            builder: (context, state) {
              if (state is NetworkConnectedState) {
                return const Text('Connected',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold));
              } else if (state is NetworkDisconnectedState) {
                return const Text('Disconnect',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.bold));
              } else {
                return const Text('Loading...',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 28,
                        fontWeight: FontWeight.bold));
              }
            },
          ),
        ],
      ),
    ));
  }
}