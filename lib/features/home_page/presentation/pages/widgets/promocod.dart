import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';

class PromocodWidget extends StatelessWidget {
  const PromocodWidget({
    Key? key,
    required this.image,
    required this.content,
    required this.promo,
  }) : super(key: key);
  final String content, image, promo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.h,
      width: 186.w,
      // padding: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          image:  DecorationImage(
              image: AssetImage('assets/images/vaqtinchalik/pr1.png'),fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(22.r)),
      child: Stack(
        // clipBehavior: Clip.antiAlias,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 18, left: 17, bottom: 11),
                width: 146,
                child: Text(
                  content,
                  style:  TextStyle(
                      color: cbulimTextColor,
                      fontSize: 10.sp,
                      fontFamily: 'Medium'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: cFirstColor,
                ),
                margin: const EdgeInsets.only(left: 17, bottom: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: Text(promo,
                    style: TextStyle(
                      fontFamily: 'Medium',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: cWhiteColor,
                    )),
              ),
            ],
          ),
          Positioned(top: 20, right: -30, child: Image.asset(image)),
        ],
      ),
    );
  }
}
//'assets/images/vaqtinchalik/promocod1.svg'
