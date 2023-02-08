import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_constants.dart';


class OrderStatus extends StatelessWidget {
  OrderStatus({
    Key? key,
    required this.title,
    required this.status,
    required this.subtitle,
    required this.time,
    required this.icon,
  }) : super(key: key);
  final String icon, title, subtitle, time;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      margin: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          SizedBox(
            width: 14.w,
          ),
          SvgPicture.asset('assets/icons/check_order.svg',
              color: status ? cFirstColor : cGreyColor,
              height: 12.h,
              width: 12.w),
          SizedBox(
            width: 16.w,
          ),
          SvgPicture.asset(icon,
              color: status ? cFirstColor : cGreyColor,
              height: 24.h,
              width: 24.w),
          SizedBox(width: 13.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: status ? cFirstColor : cGreyColor,
                    fontSize: 16.sp,
                    fontFamily: 'Medium',
                    fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'Medium',
                  color: status ? cFirstColor : cGreyColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            time,
            style: TextStyle(
                fontFamily: 'Medium',
                color: status ? cFirstColor : cGreyColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(width: 20.w),
        ],
      ),
    );
  }
}
