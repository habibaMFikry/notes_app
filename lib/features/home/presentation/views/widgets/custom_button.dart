import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, this.isLoading = false});

  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return /*Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        /*SizedBox(
      width: double.infinity,*/
        child: */
        Padding(
      padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
      child: ElevatedButton(
        /*style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).primaryColor),
                  ),*/
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.w),
          ),
          //shape: StadiumBorder(),
          backgroundColor: kPrimaryColor,
          minimumSize: Size.fromHeight(5.h),
        ),
        onPressed: onPressed,
        child: isLoading
            ? SizedBox(
                height: 3.h,
                width: 6.w,
                child: const CircularProgressIndicator(
                  color: Colors.black,
                  //strokeWidth: 1.w,
                ),
              )
            : Text(
                'Add',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
              ),
        // ),
        // ),
      ),
    );
  }
}
