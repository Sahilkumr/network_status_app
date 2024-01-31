import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_status_app/form_validation/signIn/bloc/signin_bloc.dart';

class FormHomeScreen extends StatelessWidget {
  const FormHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: emailController,
              onChanged: (value) {
                BlocProvider.of<SigninBloc>(context).add(
                  SingInFieldsChangedEvent(
                    emailValue: emailController.text,
                    passwordValue: passwordController.text,
                  ),
                );
              },
              decoration: const InputDecoration(
                hintText: 'Enter your Email Id',
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: passwordController,
              onChanged: (value) {
                BlocProvider.of<SigninBloc>(context).add(
                  SingInFieldsChangedEvent(
                    emailValue: emailController.text,
                    passwordValue: passwordController.text,
                  ),
                );
              },
              decoration: const InputDecoration(
                hintText: 'Enter your Password',
              ),
            ),
            BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) {
                if (state is SinginErrorState) {
                  return Text(
                    state.error.toString(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(height: 10),
            BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) {
                return (state is SinginLoadingState)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : OutlinedButton(
                        onPressed: () {
                          BlocProvider.of<SigninBloc>(context).add(
                            SingInButtonEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        },
                        child: const Text('Login'),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
