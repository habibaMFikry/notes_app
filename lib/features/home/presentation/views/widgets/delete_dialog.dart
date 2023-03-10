import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../data/models/note_model.dart';
import '../../manager/notes_cubit/notes_cubit.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you want to delete this note?'),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text(
            'No',
            style: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
          onPressed: () {
            note.delete();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.of(context).pop(true);
            //print(ModalRoute.of(context)!.settings.name);
            /* Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const NotesView();
                },
              ),
            );*/
          },
          child: const Text(
            'Yes',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
