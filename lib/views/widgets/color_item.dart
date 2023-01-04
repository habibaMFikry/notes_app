import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return /*Padding(
      padding: EdgeInsets.all(0.25.h),
      child: */
        isActive
            ? CircleAvatar(
                radius: 8.w,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 5.5.w,
                  backgroundColor: color,
                ),
              )
            : CircleAvatar(
                radius: 8.w,
                backgroundColor: color,
              );
    // );
  }
}
