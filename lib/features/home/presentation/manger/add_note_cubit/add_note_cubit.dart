import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:notes_app/constants.dart';
import '../../../data/models/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = const Color(0xffAC3931);
  //bool isLoading = false;
  addNote(NoteModel note) async {
    note.color = color.value;

    //isLoading = true;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      //isLoading = false;
      emit(AddNoteSuccess());
    } catch (e) {
      //isLoading = false;
      emit(AddNoteFailure(e.toString()));
    }
  }
}
