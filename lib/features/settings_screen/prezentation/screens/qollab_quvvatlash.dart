import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';

class QollabQuvvatlashScreen extends StatefulWidget {
  const QollabQuvvatlashScreen({Key? key}) : super(key: key);

  @override
  _QollabQuvvatlashScreenState createState() => _QollabQuvvatlashScreenState();
}

class _QollabQuvvatlashScreenState extends State<QollabQuvvatlashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cHomeBackgroundColor,
      appBar: AppBar(
        shadowColor: cThirdColor.withOpacity(0.2),
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22.r),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: cWhiteColor,
        toolbarHeight: 122.h,
        title: Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
              ),
              Text(
                'Qo’llab quvvatlash',
                style: textStyle16,
              ),
              IconButton(onPressed: null, icon: Container())
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 35.h,
                ),
                SvgPicture.asset('assets/images/logo.svg'),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'версия 1.95',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: cGrayColor,
                      fontFamily: 'Medium',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  '© 2020 “IMSOFT GROUP”',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: cGrayColor,
                      fontFamily: 'Medium',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 500.h,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -10),
                  blurRadius: 50.r,
                  color: cThirdColor.withOpacity(0.2),
                )
              ], color: cWhiteColor, borderRadius: BorderRadius.circular(22.r)),
              margin: EdgeInsets.only(top: 34.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 26.h,
                  ),
                  Center(
                      child: SvgPicture.asset(
                          'assets/images/qollab_quvvatlash.svg')),
                  const Spacer(),
                  Container(
                      // margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.only(left: 25.0.w),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/callphoneIcon.svg',
                              color: cWhiteColor,
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            Text(
                              'Qo’ng’iroq qilish',
                              style: TextStyle(
                                  color: cWhiteColor,
                                  fontSize: 16.sp,
                                  fontFamily: 'Medium'),
                            )
                          ],
                        ),
                        style: buttonStyle,
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 12.h, bottom: 22.h),
                      padding: EdgeInsets.only(left: 25.0.w),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/chaticonactive.svg',
                              color: cWhiteColor,
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            Text(
                              'Xabar yozish',
                              style: TextStyle(
                                  color: cWhiteColor,
                                  fontSize: 16.sp,
                                  fontFamily: 'Medium'),
                            )
                          ],
                        ),
                        style: buttonStyle,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
