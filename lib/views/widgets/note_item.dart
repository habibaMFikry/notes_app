import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/widgets/delete_dialog.dart';
import 'package:sizer/sizer.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;

  /*int? checkContent() {
    int? x;
    if (note.content.length >= 25) {
      x = 20;
    } else if (note.content.length > 25 && note.content.contains(' ')) {
      x = note.content.indexOf(' ');
    } else if (note.content.contains('\n')) {
      x = note.content.indexOf('\n');
    } /*else {
      x = 10;
    }*/
    return x;
  }*/

  @override
  Widget build(BuildContext context) {
    //final date = DateTime.parse(note.date);
    return /*Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: */
        Dismissible(
      key: ValueKey(note.title),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => DeleteDialog(note: note),
        );
      },
      /*onDismissed: (direction) {
        note.delete();
        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
      },*/
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditNoteView(
                  note: note,
                );
              },
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.only(top: 3.h, bottom: 3.h, left: 1.h),
          //height: 25.h,
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(4.w),
          ),
          child: /*Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 1.h),
            child: */
              Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black, fontSize: 23.sp),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: /*SizedBox(
                    height: 3.5.h,
                    child:*/
                      Text(
                    note.content,
                    //note.content.characters.getRange(0, 25).toString(),
                    maxLines: 1,
                    style: const TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                  //),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 8.w,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => DeleteDialog(note: note),
                    );
                    /*NoteModel deletedNote = note;
                    Color deletedNoteColor = Color(deletedNote.color);
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    //ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        backgroundColor: kPrimaryColor,
                        content: const Text('Note deleted'),
                        duration: const Duration(seconds: 5),
                        action: SnackBarAction(
                          textColor: Colors.black,
                          label: 'UNDO',
                          onPressed: () {
                            BlocProvider.of<AddNoteCubit>(context).color =
                                deletedNoteColor;
                            BlocProvider.of<AddNoteCubit>(context)
                                .addNote(deletedNote);
                            BlocProvider.of<NotesCubit>(context)
                                .fetchAllNotes();
                          },
                        ),
                      ),
                    );*/
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 3.h),
                child: Text(
                  //DateFormat('dd/MM/yyyy  hh:mm').format(date),
                  note.date,
                  style: const TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
            ],
            // ),
            //),
          ),
        ),
      ),
    );
  }
}
