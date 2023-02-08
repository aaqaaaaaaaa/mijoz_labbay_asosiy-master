import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';

class LitsenziyaScreen extends StatefulWidget {
  const LitsenziyaScreen({Key? key}) : super(key: key);

  @override
  _LitsenziyaScreenState createState() => _LitsenziyaScreenState();
}

class _LitsenziyaScreenState extends State<LitsenziyaScreen> {
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
                'Litsenziya va shartnoma',
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
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, -10),
                      blurRadius: 50.r,
                      color: cThirdColor.withOpacity(0.2),
                    )
                  ],
                  color: cWhiteColor,
                  borderRadius: BorderRadius.circular(22.r)),
              margin:  EdgeInsets.only(top: 34.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(
                    height: 26.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/image1.svg' ),
                    //  width: 281.w,height: 258.h,fit: BoxFit.cover,
                    ],
                  ),
                  const Spacer(flex: 2),
                  Container(
                    // margin: EdgeInsets.only(top: 60.h),
                    width: 250.w,
                    padding:  EdgeInsets.only(left: 25.0.w),
                    child:  Text(
                      'Ushbu loyiha CP:75557 raqami ostida patentlangan © 2020',
                      style: textStyle14,
                    ),
                  ),
                  const Spacer(),

                  Padding(
                    padding: EdgeInsets.only(left: 25.0.w),
                    child:
                    Text(
                      'Labbay ilovadagi ilovalarning ishlashi va foydalanuvchi harakatlariga oid anonim statistik ma\'lumotlarni to\'plash huquqini o\'zida saqlab qoladi.',
                    style: TextStyle(color: cGrayColor,fontFamily: 'Regular',fontSize: 12.sp),
                    ),
                  ),
                  const Spacer(flex: 2),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
