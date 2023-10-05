import 'package:clean_arch_auth_with_bloc/core/bloc/bloc_state.dart';
import 'package:clean_arch_auth_with_bloc/features/register/presentation/bloc/register_event.dart';
import 'package:flutter/material.dart';

import '../../../../core/bloc/bloc.dart';
import '../../../../core/bloc/event.dart';
import '../../domain/usecases/signup_usecase_impl.dart';

class RegisterBloc extends Bloc {
  SignUpUsecaseImpl signUp;

  RegisterBloc(this.signUp);

  @override
  mapListenEvent(Event event) {
    if (event is OnReadyEvent) {
      _handleOnReady();
    } else if (event is SignUpEvent) {
      _handleSignUp(event.email, event.password, event.context);
    }
  }

  _handleOnReady() {
    dispatchState(BlocStableState(data: null));
  }

  _handleSignUp(String email, String password, BuildContext context) async {
  
    try {
      final result = await signUp.signUp(email, password);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Usuario Criado Com sucesso')));
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao criar o usuario ${e.toString()}')));
    }
  }
}
