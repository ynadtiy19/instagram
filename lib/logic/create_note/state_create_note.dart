class CreateNoteState {}

class CreateNoteInitialState extends CreateNoteState {}

class CreateNoteLoodingState extends CreateNoteState {}

class CreateNoteSucssesState extends CreateNoteState {}

class CreateNoteErrorState extends CreateNoteState {
  final String messageError;

  CreateNoteErrorState({required this.messageError});
}
