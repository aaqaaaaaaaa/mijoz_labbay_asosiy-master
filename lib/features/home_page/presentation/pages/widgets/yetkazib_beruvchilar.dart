import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';

class YetkazibBeruvchilar extends StatefulWidget {
  const YetkazibBeruvchilar({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
  }) : super(key: key);
  final String title, image, price;

  @override
  _YetkazibBeruvchilarState createState() => _YetkazibBeruvchilarState();
}

class _YetkazibBeruvchilarState extends State<YetkazibBeruvchilar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cSecondColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      height: 163.h,
      // width: MediaQuery.of(context).size.width/1.1,
      child: Column(
        children: [
          ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                widget.image,
                fit: BoxFit.fitWidth,
                height: 110.h,
                width: MediaQuery.of(context).size.width / 1.1,
              )),
          // const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontFamily: 'Medium',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: cBlackColor,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 18),
                  decoration: BoxDecoration(
                    color: cThirdColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/truck-fast.svg'),
                      const SizedBox(width: 5,),
                      // const Text('±',textScaleFactor: 1,style:  TextStyle(wordSpacing: -100),),
                      Text(
                        '±5000',
                        style:  TextStyle(color: cFirstColor,fontSize: 10.sp,fontFamily: 'Medium'),
                      )
                    ],
                  ))
            ],
          ),
          // Container(
          //   height: 206.h,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //       colors: [
          //         cWhiteColor.withOpacity(0),
          //         cHomeBackgroundColor.withOpacity(0.72),
          //         cHomeBackgroundColor.withOpacity(1),
          //
          //       ]
          //     )
          //   ),
          // )
        ],
      ),
    );
  }
}


