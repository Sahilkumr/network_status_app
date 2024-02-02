import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_status_app/network_status/cubit/network_cubit.dart';
import 'package:network_status_app/sign_in_user/signIn/bloc/signin_bloc.dart';
import 'package:network_status_app/sign_in_user/signin_screen.dart';

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
            BlocConsumer<NetworkCubit, NetworkStates>(
              listener: (context, state) {
                if (state == NetworkStates.connected) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 2),
                      showCloseIcon: true,
                      content: Text('You are Connnected to Internet'),
                    ),
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => SigninBloc(),
                        child: const SignInScreen(),
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 2),
                      showCloseIcon: true,
                      content: Text('You are DisConnnected From Internet'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state == NetworkStates.connected) {
                  return const Text('Connected',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                          fontWeight: FontWeight.bold));
                } else if (state == NetworkStates.disconnected) {
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
      ),
    );
  }
}
