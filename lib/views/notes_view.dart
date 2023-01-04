import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/add_note.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';
import 'package:sizer/sizer.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.w),
              ),
              context: context,
              builder: (context) {
                return const AddNote();
              });
        },
      ),
    );
  }
}
