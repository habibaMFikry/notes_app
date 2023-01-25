import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onPressed});

  final Icon icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 12.w,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: IconButton(
        //style: ,
        icon: icon, //size: 7.w,
        onPressed: onPressed,
      ),
    );
  }
}
