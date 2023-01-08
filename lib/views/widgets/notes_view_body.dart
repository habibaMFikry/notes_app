import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/notes_list_view.dart';
import 'package:notes_app/views/widgets/search_list_view.dart';
import 'package:sizer/sizer.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  //List<NoteModel>? searchedNotesList;

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = Text(
    'Notes',
    style: TextStyle(color: Colors.white, fontSize: 25.sp),
  );
  String? searchString;

  @override
  Widget build(BuildContext context) {
    //List<NoteModel>? notes = BlocProvider.of<NotesCubit>(context).notes ?? [];
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h, right: 2.5.h, left: 2.5.h),
      child: Column(
        children: [
          CustomAppBar(
            title: customSearchBar, //'Notes',
            icon: customIcon, //customIcon,
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = /*CustomAppBar(
                    icon: const Icon(
                      Icons.search,
                      size: 28,
                    ),
                    title: */
                      /* BlocBuilder<NotesCubit, NotesState>(
                    builder: (context, state) {
                      return */
                      Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          //searchString = '';
                          searchString = value.toLowerCase();
                          BlocProvider.of<NotesCubit>(context)
                              .searchNote(searchString);
                          /* for (var i = 0; i > 10; i++) {
                                                  if (searchString == notes[i].title) {
                                                    searchedNotesList = notes;
                                                  }
                                                }*/
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          //fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    // );
                    //},
                  );
                  //);
                } else {
                  customIcon = const Icon(Icons.search);
                  searchString = null;
                  customSearchBar = Text(
                    'Notes',
                    style: TextStyle(color: Colors.white, fontSize: 25.sp),
                  );
                }
              });
            },
          ),
          (customIcon.icon == Icons.cancel)
              ? SearchList(
                  searchText: searchString,
                )
              : const NotesListView(),
        ],
      ),
    );
  }
}
