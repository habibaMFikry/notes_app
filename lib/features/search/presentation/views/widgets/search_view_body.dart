import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/widgets/custom_app_bar.dart';
import 'package:notes_app/core/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../../../home/presentation/manger/notes_cubit/notes_cubit.dart';
import 'search_list_view.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String? searchString;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h, right: 1.5.h, left: 1.5.h),
      child: Column(
        children: [
          CustomAppBar(
            title: Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 2.h),
                child: CustomTextField(
                  hint: 'Search',
                  initialValue: '',
                  onChanged: (value) {
                    setState(() {
                      searchString = value.toLowerCase();
                      BlocProvider.of<NotesCubit>(context)
                          .searchNote(searchString);
                    });
                  },
                  /*decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),*/
                ),
              ),
            ),
            icon: const Icon(Icons.cancel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SearchList(searchText: searchString)
        ],
      ),
    );
  }
}
