import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../../data/models/note_model.dart';
import '../../manager/add_note_cubit/add_note_cubit.dart';
import 'add_colors_list.dart';
import 'custom_button.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    //var date = DateTime.now();
    //var formattedDate = DateFormat('dd/MM/yyyy  hh:mm:ss').format(date);
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: Column(
        children: [
          CustomTextField(
            initialValue: '',
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          /*SizedBox(
            height: 2.h,
          ),*/
          CustomTextField(
            initialValue: '',
            onSaved: (value) {
              content = value;
            },
            hint: 'Content',
            maxLines: 6,
          ),
          const AddColorsList(),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var noteModel = NoteModel(
                        title: title!,
                        content: content!,
                        date: DateTime.now().toString(), //formattedDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    setState(() {
                      autoValidate = AutovalidateMode.always;
                    });
                  }
                },
              );
            },
          ),
          /*SizedBox(
            height: 2.h,
          ),*/
        ],
      ),
    );
  }
}
