import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:intl/intl.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_color_list.dart';
import 'package:sizer/sizer.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    //var date = DateTime.now();
    //var formattedDate = DateFormat('dd/MM/yyyy  hh:mm').format(date);
    return Padding(
      padding: EdgeInsets.only(right: 2.5.h, left: 2.5.h),
      child: Column(
        children: [
          CustomAppBar(
            title: Text('Edit Note',
                style: TextStyle(color: Colors.white, fontSize: 25.sp)),
            icon: const Icon(Icons.check),
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              //widget.note.date = formattedDate;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EditColorsList(
                    note: widget.note,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                    initialValue: widget.note.title,
                    hint: 'Title',
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                  /*SizedBox(
                height: 2.h,
              ),*/
                  CustomTextField(
                    initialValue: widget.note.content,
                    hint: 'Content',
                    maxLines: 15,
                    onChanged: (value) {
                      content = value;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
