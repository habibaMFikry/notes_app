import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../../../constants.dart';
import '../../../data/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  //late List<NoteModel> searchedNotes;
  //List<NoteModel>? reversedNotesList;
  List<NoteModel>? results;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    notes = notesBox.values.toList();
    notes!.sort((b, a) => a.date.compareTo(b.date));

    //print('object');
    //print(notes![1].title);

    //reversedNotesList = notes!.reversed.toList();

    emit(NotesSuccess());
  }

  List<NoteModel>? searchNote(String? searchText) {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    /* notes = notesBox.values.toList().reversed.toList();
    var noteLength = notes!.length;

    for (var i = 0; i > noteLength; i++) {
      if (searchText == notes![i].title) {
        searchedNotes = notes;
      }
    }*/
    results = (searchText == null || searchText == '')
        ? notesBox.values.toList().reversed.toList() // whole list
        : notesBox.values
            .where((c) => c.title.toLowerCase().contains(searchText))
            .toList()
            .reversed
            .toList();
    //print(results);
    return results;
  }
}
