import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/note_item.dart';
import 'package:sizer/sizer.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key}); //const

  //final colorsData = const [];

  //List<NoteModel>? searchedNotes;

  //final List<NoteModel>? searchedNotesList;

  //String? searchString;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        /*List<NoteModel>? searchedNotes =
            BlocProvider.of<NotesCubit>(context).results ?? [];*/

        return Expanded(
          child: (notes.isEmpty)
              ? const Center(
                  child: Text('No notes to show, add a new note.'),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: NoteItem(
                        note: /*(searchString != null && searchedNotes.isNotEmpty
                            /* &&
                              searchString == notes[0].title*/
                            )
                            ? searchedNotes[index]
                            :*/
                            notes[index], //searchedNotesList![index],
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
