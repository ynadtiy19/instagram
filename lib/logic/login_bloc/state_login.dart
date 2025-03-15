class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoodingState extends LoginState {}

class LoginSucssesState extends LoginState {}

class LoginErrorState extends LoginState {
 final String messageError;

  LoginErrorState({required this.messageError});
}
