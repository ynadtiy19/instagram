import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_app/logic/sginup_bloc/state_sginup.dart';


class SginupCubit extends Cubit<SginupState> {
  final FirebaseAuth firebaseAuth;
  SginupCubit(this.firebaseAuth) : super(SginupInitialState());

  Future sginUp(String e, String pass) async {
    emit(SginupLoodingState());
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: e, password: pass);

      emit(SginupSucssesState());
    } catch (e) {
      emit(
        SginupErrorState(
          messageError: e.toString(),
        ),
      );
    }
  }
}
