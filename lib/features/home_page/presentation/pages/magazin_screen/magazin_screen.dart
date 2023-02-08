import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/core/widgets/navigator.dart';
import 'package:mijoz_labbay/features/home_page/domain/bloc/home_bloc.dart';
import 'package:mijoz_labbay/features/home_page/presentation/pages/widgets/bulimlar_widget.dart';
import 'package:mijoz_labbay/features/home_page/presentation/pages/widgets/olib_keting_widget.dart';
import 'package:mijoz_labbay/features/home_page/presentation/pages/widgets/promocod.dart';
import 'package:mijoz_labbay/features/home_page/presentation/pages/widgets/yetkazib_beruvchilar.dart';
import 'package:mijoz_labbay/features/hudud_map/presentation/widgets/parse.dart';
import 'package:mijoz_labbay/features/search_page/presentation/pages/search_page.dart';
import 'package:mijoz_labbay/features/shop_page/presentation/pages/shop_screen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MagazinScreen extends StatefulWidget {
  const MagazinScreen({Key? key}) : super(key: key);

  static Widget screen() => BlocProvider(
      create: (context) => HomeBloc(context), child: const MagazinScreen());

  @override
  State<MagazinScreen> createState() => _MagazinScreenState();
}

class _MagazinScreenState extends State<MagazinScreen> {
  int initialIndex = 0;
  late ItemScrollController _itemScrollController;
  int itemCount = 15;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _itemScrollController = ItemScrollController();
    periodicTimer();
  }

  Future periodicTimer() async {
    _itemScrollController = ItemScrollController();

    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if(mounted){
        if (initialIndex != itemCount - 1) {
          setState(() {
            _scrollToIndex(initialIndex++);
          });
        } else {
          _itemScrollController.scrollTo(
              index: 0,
              duration: const Duration(microseconds: 1),
              curve: Curves.easeInOutCubic);
          initialIndex = 0;
        }
      }
    });
  }

  void _scrollToIndex(int index) {
    setState(() {});
    _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic);
  }



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () => BlocProvider.of<HomeBloc>(context).add(HomeLoadingEvent()),
    );
    // _itemScrollController = ItemScrollController();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: cHomeBackgroundColor,
      appBar: AppBar(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(22.r),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: cWhiteColor,
          toolbarHeight: 122.h,
          title: Container(
              width: 334.w,
              margin: const EdgeInsets.only(left: 10),
              child: Row(children: [
                InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(15.r),
                    child: Container(
                        height: 65.h,
                        decoration: BoxDecoration(
                            color: cBackButtonColor,
                            borderRadius: BorderRadius.circular(15.r)),
                        width: 280.w,
                        child: Row(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 19.0.w),
                            child:
                                SvgPicture.asset('assets/icons/location.svg'),
                          ),
                          SizedBox(
                              width: 210.w,
                              child: Text(city,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyle16))
                        ]))),
                SizedBox(width: 10.w),
                IconButton(
                    onPressed: () {
                      Navigator.push(context, FadeRoute2(const SearchPage()));
                    },
                    icon: SvgPicture.asset('assets/icons/search_icon.svg'))
              ]))),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeFailedState) {
            return const Center(
              child: Text('No internet'),
            );
          } else if (state is HomeLoadedState) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                          height: 106.h,
                          margin: const EdgeInsets.only(top: 28),
                          child: ScrollablePositionedList.builder(
                              padding: const EdgeInsets.only(left: 28),
                              itemScrollController: _itemScrollController,
                              physics: const BouncingScrollPhysics(),
                              itemCount: itemCount,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                index = initialIndex;
                                return const Padding(
                                  padding: EdgeInsets.only(right: 12.0),
                                  child: PromocodWidget(
                                    image:
                                        'assets/images/vaqtinchalik/20-206076_jpg-free-stock-flat-patties-serves-up-award 2.png',
                                    content:
                                        '25% chegirma birinchi uchun kod bo\'yicha buyurtma berish',
                                    promo: 'PROMO25',
                                  ),
                                );
                              })),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 24.0, bottom: 12, left: 28),
                        child: Text(
                          'Bo’limlar',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Medium',
                              color: cbulimTextColor),
                        ),
                      ),
                      SizedBox(
                        height: 106.h,
                        // margin: const EdgeInsets.only(top: 28),
                        child: ListView.builder(
                            padding: const EdgeInsets.only(left: 28),
                            physics: const BouncingScrollPhysics(),
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: BulimlarWidget(
                                    image:
                                        'assets/images/vaqtinchalik/image 4.png',
                                    title: 'fast food'),
                              );
                            }),
                      ),
                      Container(
                        // height: 2000,
                        margin: EdgeInsets.only(top: 24.h, right: 25.w),
                        child: ListView.builder(
                            padding: EdgeInsets.only(left: 28.w),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            // scrollDirection: Axis.horizontal,
                            /// malumot kelganida ifga && malumotni length >10 katta bolsa deb yozib qo'yishim kk
                            itemBuilder: (context, index) {
                              if (index == 3) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      child: const YetkazibBeruvchilar(
                                          title: 'Les Ailes',
                                          image:
                                              'assets/images/vaqtinchalik/1 588239511.png',
                                          price: '5000'),
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ShopScreen(
                                                    oshxonaNomi: 'Les Ailes',
                                                  ))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 24.0, bottom: 12),
                                      child: Text(
                                        'O’zingiz olib keting',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'Medium',
                                            color: cbulimTextColor),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 28),
                                      height: 134.h,
                                      child: ListView.builder(
                                          // padding: const EdgeInsets.only(left: 28),
                                          physics:
                                              const BouncingScrollPhysics(),
                                          clipBehavior: Clip.none,
                                          itemCount: 10,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 12.0),
                                              child: OlibKetingWidget(
                                                image:
                                                    'assets/images/vaqtinchalik/scale_1200 1.png',
                                                title: 'Energy Burger',
                                                distance: 200,
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ShopScreen(
                                                oshxonaNomi: 'Les Ailes',
                                              ))),
                                  child: const YetkazibBeruvchilar(
                                      title: 'Les Ailes',
                                      image:
                                          'assets/images/vaqtinchalik/1 588239511.png',
                                      price: '5000'),
                                ),
                              );
                            }),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 28),
                        height: 134.h,
                        child: ListView.builder(
                            padding: const EdgeInsets.only(left: 28),
                            physics: const BouncingScrollPhysics(),
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: OlibKetingWidget(
                                  image:
                                      'assets/images/vaqtinchalik/scale_1200 1.png',
                                  title: 'Energy Burger',
                                  distance: 200,
                                ),
                              );
                            }),
                      ),
                       SizedBox(height: 70.h),
                    ],
                  ),
                ),
              ],
            );
          }
          return const Center(
              child: CircularProgressIndicator(
            color: cFirstColor,
          ));
        },
      ),
    );
  }

@override
void dispose() {
  super.dispose();
  timer.cancel();
  _itemScrollController.isAttached;
}
}
