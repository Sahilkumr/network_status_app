import 'package:flutter/material.dart';

class SignInWithPhoneScreen extends StatelessWidget {
  const SignInWithPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login With Phone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Enter your Number',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('SignIn'),
          ),
        ]),
      ),
    );
  }
}
