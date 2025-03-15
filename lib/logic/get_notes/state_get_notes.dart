import 'package:instgram_app/data/edit_profile_model.dart';


class GetNotesState {}

class GetNotesInitialState extends GetNotesState {}

class GetNotesLoodingState extends GetNotesState {}

class GetNotesSucssesState extends GetNotesState {

List <EditProfileModel> note ;
GetNotesSucssesState(this.note);

}

class GetNotesErrorState extends GetNotesState {
  final String messageError;

  GetNotesErrorState({required this.messageError});
}
