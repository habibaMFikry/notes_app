import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../models/note_model.dart';
import '../edit_note_view.dart';
import 'delete_dialog.dart';

class NewNoteItem extends StatelessWidget {
  const NewNoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(note.date);

    return Dismissible(
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
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(2.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title:
                    /* SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:*/
                    /*  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [*/
                    Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Text(
                    note.title, //.characters
                    //.getRange(0, 8)
                    //.toString(),
                    overflow: TextOverflow.ellipsis,
                    //maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                /*IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => DeleteDialog(note: note),
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),*/
                //],

                //),
                // ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      height: 0,
                      color: Colors.black,
                      thickness: 1,
                      endIndent: 8,
                      indent: 8,
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Text(
                        note.content,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 1.h, top: 1.h, bottom: 1.h),
                child: Text(
                  DateFormat('dd/MM/yyyy  hh:mm').format(date),
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
