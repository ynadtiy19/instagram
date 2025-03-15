import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_app/data/edit_profile_model.dart';
import 'package:instgram_app/logic/get_notes/state_get_notes.dart';


class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitialState());

  Future getNotes() async {
    emit(GetNotesLoodingState());
    try {
      final response =
          await FirebaseFirestore.instance.collection('profile').get();
      final notes =
          response.docs.map((e) => EditProfileModel.fromJson(e.data())).toList();

      emit(GetNotesSucssesState(notes));
    } catch (e) {
      emit(GetNotesErrorState(messageError: e.toString()));
    }
  }
}
