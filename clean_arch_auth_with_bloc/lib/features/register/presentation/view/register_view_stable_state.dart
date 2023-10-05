import 'package:clean_arch_auth_with_bloc/features/register/presentation/bloc/register_event.dart';
import 'package:flutter/material.dart';

import '../bloc/register_bloc.dart';

class RegisterViewStableState extends StatefulWidget {
  final RegisterBloc bloc;
  const RegisterViewStableState({required this.bloc, super.key});

  @override
  State<RegisterViewStableState> createState() =>
      _RegisterViewStableStateState();
}

class _RegisterViewStableStateState extends State<RegisterViewStableState> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: passwordController,
            ),
            ElevatedButton(
                onPressed: () {
                  widget.bloc.dispatchEvent(SignUpEvent(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context));
                },
                child: const Text('registrar-se')),
            TextButton(onPressed: () {}, child: Text('Faça Login'))
          ],
        ),
      ),
    );
  }
}
