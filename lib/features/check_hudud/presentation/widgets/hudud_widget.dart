import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';

class HududWidget extends StatelessWidget {
  const HududWidget({
    Key? key,
    required this.isNotChecked,
    required this.hudud,
  }) : super(key: key);

  final bool isNotChecked;
  final String hudud;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
      height: 65.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isNotChecked ? cGrayColorBackground : cSecondColor,
        borderRadius: BorderRadius.circular(cRadius15.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 25.w,
          ),
          SvgPicture.asset(
            "assets/icons/location.svg",
            color: isNotChecked ? cGrayColor : cFirstColor,
            height: 24.h,
            width: 24.w,
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            hudud,
            style: TextStyle(
              color: isNotChecked ? cGrayColor : cFirstColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Medium'
            ),
          ),
        ],
      ),
    );
  }
}
