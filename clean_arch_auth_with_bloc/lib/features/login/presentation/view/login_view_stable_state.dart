import 'package:clean_arch_auth_with_bloc/features/login/presentation/bloc/login_bloc.dart';
import 'package:clean_arch_auth_with_bloc/features/login/presentation/bloc/login_event.dart';
import 'package:flutter/material.dart';

class LoginViewStableState extends StatefulWidget {
  final LoginBloc bloc;
  const LoginViewStableState({required this.bloc, super.key});

  @override
  State<LoginViewStableState> createState() => _LoginViewStableStateState();
}

class _LoginViewStableStateState extends State<LoginViewStableState> {
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
                  widget.bloc.dispatchEvent(SignInEvent(
                    emailController.text,
                    passwordController.text,
                    context,
                  ));
                },
                child: const Text('Logar')),
            TextButton(onPressed: (){
              widget.bloc.dispatchEvent(LoginEventNavigatePush(context));
            }, child: const Text('Cadastre-se'))
          ],
        ),
      ),
    );
  }
}
