import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_app/logic/login_bloc/state_login.dart';


class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth firebaseAuth;
  LoginCubit(this.firebaseAuth) : super(LoginInitialState());

  Future Login(String e, String Pass) async {
    emit(LoginLoodingState());
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: e, password: Pass);

      emit(LoginSucssesState());
    } catch (e) {
      emit(
        LoginErrorState(
          messageError: e.toString(),
        ),
      );
    }
  }
}
