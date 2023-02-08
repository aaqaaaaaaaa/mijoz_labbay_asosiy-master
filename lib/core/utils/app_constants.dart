import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// All colors
const cFirstColor = Color(0xFF15BE77);
const cSecondColor = Color(0xFFE8F9F2);
const cThirdColor = Color(0xFFBAF4D2);
const cBackInputColor = Color(0xFFFAFAFA);
const cBackButtonColor = Color(0xFFF2F2F2);
const cTextColor = Color(0xFF475E6A);
const cBlackColor = Color(0xFF000000);
const cWhiteColor = Color(0xFFFFFFFF);
const cRedColor = Color(0xFFFF3030);
const cGrayColor = Color(0xFF828282);
const cGrayColorBackground = Color(0xFFF2F2F2);
const cYellowColor = Color(0xFFFFC92F);
const cBackColorIcon = Color(0xFF99BAFF);
const cBackColorImage = Color(0xFFFF007A);

// Jalolxon
const ctextColor = Color(0xFF4f4f4f);
const cHintTextColor = Color(0xff3B3B3B);
const cTextFieldIcnColor = Color(0xff9FEDC2);
const cShopScreenColor = Color(0xffCEF6E0);

const cbulimTextColor = Color(0xFF323232);
const cHomeBackgroundColor = Color(0xFFFBFBFB);
const cGreyColor = Color(0xFFbdbdbd);
const cShopTextColor = Color(0xFF323232);
const cElevationColor = Color(0xFF5AEAB6);
const ctext2Color = Color(0xFF55D09C);
const ctextFieldColor = Color(0xffF2F3F3);
const ctextFieldHintColor = Color(0xffE0E0E0);

// All gradient
const cFirstGradient = LinearGradient(
  colors: [cFirstColor, cSecondColor],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

// All keys for local caches
const String userData = 'user_data';

// All keys for local databases
const String userTable = 'user_table';

// All sizes
double cRadius15 = 15.0.r;
double cRadius22 = 22.0.r;
const double cNumberLockW90 = 95.0;
const double cNumberLockH90 = 90.0;
const double cNumberLockText42 = 42.0;

// versions
const String version = "1.0.0";

// lock number style

const numStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: cWhiteColor);

// textStyle Jalolxon

TextStyle textStyle16 = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
  fontFamily: 'Medium',
  color: ctextColor,
);


TextStyle textStyleWhite16 =
    TextStyle(fontSize: 16.sp, fontFamily: 'Medium', color: cWhiteColor);


TextStyle textStyle14 = TextStyle(
  fontFamily: 'Regular',
  fontSize: 14.sp,
  // fontWeight: FontWeight.w500,
  color: ctextColor,
);
TextStyle textStyleBlack13 = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 13.sp,
    fontFamily: 'SemiBold');

TextStyle textStyleBlack16 = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 16.sp,
    fontFamily: 'Medium');

TextStyle textStyle10 = TextStyle(
  fontFamily: 'Regular',
  fontSize: 10.sp,
  fontWeight: FontWeight.w400,
  color: cbulimTextColor,
);
TextStyle textSubtitleStyle12 =
    TextStyle(fontSize: 12.sp, fontFamily: 'Medium', color: cGreyColor);

ButtonStyle buttonStyle = ButtonStyle(
  fixedSize: MaterialStateProperty.all(Size.fromWidth(325.w)),
  padding: MaterialStateProperty.all(const EdgeInsets.all(25)),
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0.r),
  )),
  backgroundColor: MaterialStateProperty.all(cFirstColor),
  elevation: MaterialStateProperty.all(0),
  textStyle: MaterialStateProperty.all(
    TextStyle(
      fontFamily: 'Medium',
      fontSize: 16.sp,
      color: cWhiteColor,
    ),
  ),
);

ButtonStyle buttonInActiveStyle = ButtonStyle(
  fixedSize: MaterialStateProperty.all(Size.fromWidth(325.w)),
  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0.r),
  )),
  backgroundColor: MaterialStateProperty.all(cThirdColor),
  elevation: MaterialStateProperty.all(0),
  textStyle: MaterialStateProperty.all(
    TextStyle(
      fontFamily: 'Medium',
      fontSize: 16.sp,
      color: cbulimTextColor,
    ),
  ),
);
ButtonStyle buttonActiveStyle = ButtonStyle(
  fixedSize: MaterialStateProperty.all(Size.fromWidth(325.w)),
  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0.r),
  )),
  backgroundColor: MaterialStateProperty.all(cFirstColor),
  elevation: MaterialStateProperty.all(0),
  textStyle: MaterialStateProperty.all(
    TextStyle(
      fontFamily: 'Medium',
      fontSize: 16.sp,
      color: cWhiteColor,
    ),
  ),
);
ButtonStyle settingsButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.r))),
  fixedSize: MaterialStateProperty.all(Size(314.w, 80.h)),
  elevation: MaterialStateProperty.all(50),
  shadowColor: MaterialStateProperty.all(
 cElevationColor.withOpacity(0.1),

  ),
  backgroundColor: MaterialStateProperty.all(cWhiteColor),
);
