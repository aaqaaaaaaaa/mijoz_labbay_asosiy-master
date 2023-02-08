import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';

Future checkInternetDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 6,
            sigmaY: 6,
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                SvgPicture.asset("assets/images/internet_check.svg"),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Internetda xatolik, Iltimos aloqani tekshiring",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Regular',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: cGrayColor,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                ElevatedButton(
                  onPressed: () async {},
                  child: const Text('Yoqish'),
                  style: buttonStyle,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
            elevation: 10.0,
            contentPadding: const EdgeInsets.symmetric(horizontal: 19),
          ),
        );
      });
}
