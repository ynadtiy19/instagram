import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_app/data/edit_profile_model.dart';
import 'package:instgram_app/logic/create_note/state_create_note.dart';

class CreateNoteCubit extends Cubit<CreateNoteState> {
  CreateNoteCubit() : super(CreateNoteInitialState());

  Future createNote(EditProfileModel note) async {
    emit(CreateNoteLoodingState());
    try {
      await FirebaseFirestore.instance
          .collection('profile')
          .add(note.toJson());
          

      emit(CreateNoteSucssesState());
    } catch (e) {
      emit(CreateNoteErrorState(messageError: e.toString()));
    }
  }
}
