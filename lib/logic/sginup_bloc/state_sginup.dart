class SginupState {}

class SginupInitialState extends SginupState {}

class SginupLoodingState extends SginupState {}

class SginupSucssesState extends SginupState {}

class SginupErrorState extends SginupState {
 final String messageError;

  SginupErrorState({required this.messageError});
}
