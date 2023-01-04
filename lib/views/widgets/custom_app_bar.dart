import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.onPressed});

  final Widget title;
  final Icon icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h, top: 5.h),
      child: /* Expanded(
        child:*/
          // SizedBox(
          //width: 250,
          /*child:*/ Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Text(
          title,
          /* style: TextStyle(color: Colors.white, fontSize: 25.sp),
          ),*/
          CustomIcon(
            icon: icon,
            onPressed: onPressed,
          ),
        ],
        //  ),
      ),
      //),
    );
  }
}
