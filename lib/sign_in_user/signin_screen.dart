import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_status_app/sign_in_user/signIn/bloc/signin_bloc.dart';
import 'package:network_status_app/sign_in_user/signin_phone/singin_phone.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
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
                //email
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
                //password
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
                //Signin Error
                BlocBuilder<SigninBloc, SigninState>(
                  builder: (context, state) {
                    if (State is SigninInvalidState) {
                      return const Text('nerro');
                    }
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

                //Signin Button
                BlocBuilder<SigninBloc, SigninState>(
                  builder: (context, state) {
                    return state is SinginLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : OutlinedButton(
                            onPressed: () {
                              if (state is SigninValidState) {
                                BlocProvider.of<SigninBloc>(context).add(
                                  SingInButtonEvent(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                              }
                            },
                            child: const Text('Login'),
                          );
                  },
                ),

                const SizedBox(height: 20),
                const Text(
                  'Alternately ?',
                  textAlign: TextAlign.center,
                ),
                //Sign in with Phone
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignInWithPhoneScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign In With Phone',
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
