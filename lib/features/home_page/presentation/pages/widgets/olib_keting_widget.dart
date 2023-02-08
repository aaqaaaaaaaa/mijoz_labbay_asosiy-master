import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';

class OlibKetingWidget extends StatefulWidget {
  const OlibKetingWidget(
      {Key? key,
      required this.image,
      required this.distance,
      required this.title})
      : super(key: key);
  final String image, title;
  final int distance;

  @override
  _OlibKetingWidgetState createState() => _OlibKetingWidgetState();
}

class _OlibKetingWidgetState extends State<OlibKetingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cSecondColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      height: 134.h,
      width: 127,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 127.w,
            height: 86.h,
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.fitWidth,
                )),
          ),
           SizedBox(height: 8.h),
          Container(
              margin: const EdgeInsets.only(left: 18),
              child: Text(widget.title, style: textStyle10)),
           SizedBox(height: 4.h),
          Container(
              height: 18.h,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: cThirdColor,
                borderRadius: BorderRadius.circular(13),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/icons/location.svg',
                      color: cFirstColor, height: 8.54.h),
                   SizedBox(
                    width: 5.w,
                  ),
                  // const Text('±',textScaleFactor: 1,style:  TextStyle(wordSpacing: -100),),
                   Flexible(
                    child: Text(
                      '${widget.distance}m',
                      maxLines: 1,
                      style:  TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: cFirstColor,
                          fontSize: 10.sp,
                          fontFamily: 'Medium'),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
