import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:notes_app/features/search/presentation/views/search_view.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../manger/notes_cubit/notes_cubit.dart';
import 'notes_list_view.dart';

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

  //Icon customIcon = const Icon(Icons.search);
  /*Widget customSearchBar = Text(
    'Notes',
    style: TextStyle(color: Colors.white, fontSize: 25.sp),
  );*/
  //String? searchString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h, right: 1.5.h, left: 1.5.h),
      child: Column(
        children: [
          CustomAppBar(
            title: Text(
              'Notes',
              style: TextStyle(color: Colors.white, fontSize: 25.sp),
            ), //customSearchBar,
            icon: const Icon(Icons.search), //customIcon,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => SearchView()),
                ),
              );
              /*setState(
                () {
                  if (customIcon.icon == Icons.search) {
                    customIcon = const Icon(Icons.cancel);
                    customSearchBar = Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            searchString = value.toLowerCase();
                            BlocProvider.of<NotesCubit>(context)
                                .searchNote(searchString);
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    );
                  } else {
                    customIcon = const Icon(Icons.search);
                    searchString = null;
                    customSearchBar = Text(
                      'Notes',
                      style: TextStyle(color: Colors.white, fontSize: 25.sp),
                    );
                  }
                },
              );*/
            },
          ),
          /*(customIcon.icon == Icons.cancel)
              ? SearchList(
                  searchText: searchString,
                )
              : */
          const NotesListView(),
        ],
      ),
    );
  }
}
