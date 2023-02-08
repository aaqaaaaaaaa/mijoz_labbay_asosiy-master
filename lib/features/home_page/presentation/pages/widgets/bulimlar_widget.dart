import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';

class BulimlarWidget extends StatefulWidget {
  const BulimlarWidget({Key? key, required this.image, required this.title})
      : super(key: key);
  final String image, title;

  @override
  _BulimlarWidgetState createState() => _BulimlarWidgetState();
}

class _BulimlarWidgetState extends State<BulimlarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cSecondColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      height: 104.h,
      width: 89.w,
      child: Column(
        children: [
          ClipRRect(
              borderRadius:
                   BorderRadius.vertical(top: Radius.circular(15.r)),
              child: Image.asset(widget.image,height: 72.h,width: 89.w,fit: BoxFit.cover,)),
           SizedBox(height: 8.h),
          Text(widget.title,style: textStyle10,)
        ],
      ),
    );
  }
}
