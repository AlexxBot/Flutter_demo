import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/services/auth-service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthInitial());

  String token = "";
  String userName = "";

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield ProcesandoState();
      final token = await authService.login(event.userName, event.password);
      if (token != "") {
        this.userName = event.userName;
        this.token = token;
        yield LoggedInState();
      } else {
        yield ErrorState(mensaje: "error el iniciar session");
      }
    }
  }
}
