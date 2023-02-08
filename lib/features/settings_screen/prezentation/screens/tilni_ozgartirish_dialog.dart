// ignore_for_file: deprecated_member_use, duplicate_ignore
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';

class TilniUzgartirishDialog extends StatefulWidget {
  const TilniUzgartirishDialog({Key? key}) : super(key: key);

  @override
  _TilniUzgartirishDialogState createState() => _TilniUzgartirishDialogState();
}

class _TilniUzgartirishDialogState extends State<TilniUzgartirishDialog> {
  bool tilniTanlash = true;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                insetPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, top: 18, bottom: 24),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/translatesettingsTranslatorIcon.svg',
                                            width: 20.w,
                                            height: 20.h),
                                         SizedBox(
                                          width: 12.w,
                                        ),
                                        Text(
                                          'Tilni o’zgartirish',
                                          style: TextStyle(
                                              fontFamily: 'Medium',
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 24.h),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 25, bottom: 12),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            tilniTanlash = true;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'O’zbek tili',
                                                style: TextStyle(
                                                    color: tilniTanlash
                                                        ? cWhiteColor
                                                        : cbulimTextColor,
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Medium'),
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/copy-success.svg',
                                              color: tilniTanlash
                                                  ? cWhiteColor
                                                  : Colors.transparent,
                                            )
                                          ],
                                        ),
                                        style: tilniTanlash
                                            ? buttonActiveStyle
                                            : buttonInActiveStyle,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 25),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            tilniTanlash = false;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Русский язык',
                                                style: TextStyle(
                                                    color: tilniTanlash
                                                        ? cbulimTextColor
                                                        : cWhiteColor,
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Medium'),
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/copy-success.svg',
                                              color: tilniTanlash
                                                  ? Colors.transparent
                                                  : cWhiteColor,
                                            )
                                          ],
                                        ),
                                        style: tilniTanlash
                                            ? buttonInActiveStyle
                                            : buttonActiveStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 32.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.95,
                                          // height: 57.h,
                                          margin:
                                              const EdgeInsets.only(right: 25),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Qaytish',
                                              style: TextStyle(
                                                  color: cbulimTextColor,
                                                  fontSize: 16.sp,
                                                  fontFamily: 'Medium'),
                                            ),
                                            style: buttonInActiveStyle,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.95,
                                          height: 57.h,
                                          margin:
                                              const EdgeInsets.only(right: 25),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {});
                                            },
                                            child: Text(
                                              'Saqlash',
                                              style: TextStyle(
                                                  color: cWhiteColor,
                                                  fontSize: 16.sp,
                                                  fontFamily: 'Medium'),
                                            ),
                                            style: buttonActiveStyle,
                                          ),
                                        ),
                                      ],
                                    )
                                  ]))
                        ])))));
  }
}
