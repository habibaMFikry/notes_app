import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import 'color_item.dart';

class EditColorsList extends StatefulWidget {
  const EditColorsList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditColorsList> createState() => _EditColorsListState();
}

class _EditColorsListState extends State<EditColorsList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                widget.note.color = kColors[index].value;
              });
            },
            child: ColorItem(
              color: kColors[index],
              isActive: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
