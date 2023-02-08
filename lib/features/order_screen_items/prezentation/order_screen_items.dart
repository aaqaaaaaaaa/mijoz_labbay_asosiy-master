import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/core/widgets/navigator.dart';
import 'package:mijoz_labbay/features/home_page/presentation/pages/home_page.dart';
import 'package:mijoz_labbay/features/order_screen_items/prezentation/widgets/order_status_widgets.dart';

class OrderScreenItems extends StatefulWidget {
  const OrderScreenItems({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderScreenItems> createState() => _OrderScreenItemsState();
}

class _OrderScreenItemsState extends State<OrderScreenItems> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;

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
              Text('Xaridlar tarixi', style: textStyle16),
              Container(width: 40.w),
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
        child: Column(
            mainAxisSize:MainAxisSize.min,
            children: [
          OrderStatus(
            title: 'Buyurtma berildi',
            subtitle: 'ID 567FE514S',
            icon: 'assets/icons/clipboard-text.svg',
            status: true,
            time: '16:18',
          ),
          OrderStatus(
            title: 'Toʻlov tasdiqlandi',
            subtitle: 'Oshxonaga yuborilmoqda',
            icon: 'assets/icons/card.svg',
            status: true,
            time: '16:23',
          ),
          OrderStatus(
            title: 'Tayyorlanmoqda',
            subtitle: 'Buyurtmangizni tayyorlamoqdamiz',
            icon: 'assets/icons/reserve.svg',
            status: true,
            time: '16:27',
          ),
          OrderStatus(
            title: 'Topshirilmoqda',
            subtitle: 'Biz buyurtmani yubormoqdamiz',
            icon: 'assets/icons/truck-fast-1.svg',
            status: false,
            time: '16:50',
          ),
          OrderStatus(
              title: 'Yetkazib berildi',
              subtitle: 'Ovqat yetkazildi, Yoqimli ishtaha 😋  ',
              icon: 'assets/icons/copy-success-1.svg',
              status: false,
              time: '16:55'),
        ]),
      ),
    );
  }
}

