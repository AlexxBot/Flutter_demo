part of 'auth_bloc.dart';

enum Proceso { Login, Logout }

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoggedInState extends AuthState {}

class LoggetOutState extends AuthState {}

class ProcesandoState extends AuthState {}

class ErrorState extends AuthState {
  final String mensaje;

  ErrorState({this.mensaje = ''});
}
