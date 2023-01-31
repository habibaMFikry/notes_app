import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../home/data/models/note_model.dart';
import '../../../../home/presentation/manager/notes_cubit/notes_cubit.dart';
import '../../../../home/presentation/views/widgets/new_note_item.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key, required this.searchText});

  final String? searchText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> searchedNotes =
            BlocProvider.of<NotesCubit>(context).results ?? [];

        return Expanded(
          child: (searchText == null)
              ? const Center(
                  child: Text('Search for a note'),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: searchedNotes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: NewNoteItem(
                        note: searchedNotes[index],
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
