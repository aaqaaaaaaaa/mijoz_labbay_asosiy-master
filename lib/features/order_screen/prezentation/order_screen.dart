import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/core/widgets/navigator.dart';
import 'package:mijoz_labbay/features/home_page/presentation/pages/home_page.dart';

import '../../order_screen_items/prezentation/order_screen_items.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cHomeBackgroundColor,
      appBar: AppBar(
        shadowColor: cElevationColor.withOpacity(0.1),
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
                  setState(() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        FadeRoute2(
                          HomePage(currentIndex: currentIndex),
                        ),
                        (route) => false);
                  });
                },
                icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
              ),
              Text(
                'Xaridlar tarixi',
                style: textStyle16,
              ),
              Container(
                width: 40.w,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 25.h, left: 15.w, right: 15.w),
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(cRadius22.r),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: cElevationColor.withOpacity(0.1),
                spreadRadius: 20)
          ],
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.push(
                context,
                FadeRoute2(
                  const OrderScreenItems(),
                )),
            child: Container(
              height: 85.h,
              margin: EdgeInsets.symmetric(vertical: 6.h),
              decoration: BoxDecoration(
                color: cElevationColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(cRadius15.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 12.w,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          "assets/images/vaqtinchalik/e4cc110fbba6c7a4da9904124beb2ef21c71baf8 1.png",
                          height: 67.h,
                          width: 67.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        height: 62.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Les Ailes",
                              style: TextStyle(
                                color: ctextColor,
                                fontSize: 16.sp,
                                fontFamily: 'Medium',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "ID 567FE514S",
                              style: TextStyle(
                                color: ctextColor,
                                fontFamily: 'Medium',
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "19/05/2022 19:50",
                              style: TextStyle(
                                color: ctextColor,
                                fontFamily: 'Medium',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "62 000",
                            style: TextStyle(
                                color: cFirstColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Medium'),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
