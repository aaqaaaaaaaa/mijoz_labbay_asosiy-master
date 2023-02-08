import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/features/home_page/presentation/pages/home_page.dart';
import 'package:mijoz_labbay/features/korzina_screen/data/korzina_hive/korzina_hive.dart';
import 'package:mijoz_labbay/features/korzina_screen/data/korzina_model/korzina_model.dart';
import 'package:mijoz_labbay/features/korzina_screen/prezentation/korzina_screen.dart';
import 'package:mijoz_labbay/features/shop_page/domain/bloc/footitems_cubit.dart';
import 'package:mijoz_labbay/features/shop_page/presentation/widgets/custom_tab_view.dart';
import 'package:mijoz_labbay/features/shop_page/presentation/widgets/dialog.dart';

import '../widgets/foot_items.dart';
import '../widgets/menu_items.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key, required this.oshxonaNomi}) : super(key: key);
  final String oshxonaNomi;

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int initPosition = 0;
  int jamiSumma = 0;
  bool isActiveSearch = false;

  @override
  void initState() {
    super.initState();
    totalAmount();
  }

  @override
  void setState(VoidCallback fn) {
    jamiSumma = 0;
    totalAmount();
    super.setState(fn);
  }

  ///jamiSumma
  totalAmount() {
    final box = Hive.box<KorzinaCard>('korzina_box');
    final transaction = box.values.toList().cast<KorzinaCard>();
    for (int i = 0; i < transaction.length; i++) {
      jamiSumma += transaction[i].number * transaction[i].price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FootItemsCubit(maxsulotlarBulimiCubit: maxsulot_list),
      child: BlocBuilder<FootItemsCubit, FootItemsState>(
        builder: (context, state) {
          final box = Hive.box<KorzinaCard>('korzina_box');
          final transaction = box.values.toList().cast<KorzinaCard>();
          return Scaffold(
            backgroundColor: cSecondColor,
            appBar: buildAppBar(context, state),
            body: Stack(
              children: [
                CustomTabView(
                  initPosition: initPosition,
                  itemCount: items.length,
                  tabBuilder: (context, index) => Tab(text: items[index]),
                  pageBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 160),
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.maxsulot.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {});
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ItemDialog(
                                  id: state.maxsulot[index].id,
                                  oshxonaNomi: widget.oshxonaNomi,
                                  tarkibi: state.maxsulot[index].tarkibi,
                                  image: state.maxsulot[index].image,
                                  jamiSumma: jamiSumma,
                                  title: state.maxsulot[index].title,
                                  price: state.maxsulot[index].price,
                                  // number: widget.number,
                                  hajmi: items,
                                  izoh: itemOne,
                                  description:
                                      state.maxsulot[index].description,
                                );
                              }).then((value) {
                            setState(() {});
                          });
                        },
                        child: FootItems(
                          oshxonaNomi: state.maxsulot[index].oshxonaNomi,
                          id: state.maxsulot[index].id,
                          image: state.maxsulot[index].image,
                          narxi: state.maxsulot[index].price,
                          nomi: state.maxsulot[index].title,
                          tarkibi: state.maxsulot[index].tarkibi,
                          tayyorlanishVaqti:
                              state.maxsulot[index].tayyorlanishVaqti,
                        ),
                      ),
                    ),
                  ),
                  onPositionChange: (index) {
                    initPosition = index;
                  },
                  // onScroll: (position) => print('nimadur $position'),
                ),
                buttonToBox(transaction, context)
              ],
            ),
            resizeToAvoidBottomInset: false,
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, FootItemsState state) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: cWhiteColor,
      toolbarHeight: 155.h,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
                ),
                isActiveSearch
                    ? searchTextField(context, state)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                          ),
                          Text(
                            widget.oshxonaNomi,
                            style: TextStyle(
                              fontFamily: 'Medium',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: ctextColor,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isActiveSearch = !isActiveSearch;
                                });
                              },
                              icon: SvgPicture.asset(
                                  'assets/icons/search_icon.svg'))
                        ],
                      ),
              ],
            ),
          ),
          SizedBox(height: 21.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ish vaqti',
                      style: TextStyle(
                          fontFamily: 'Medium',
                          fontSize: 12.sp,
                          color: cGreyColor),
                    ),
                    Text(
                      '09:30-23:00',

                      ///
                      style: TextStyle(
                          fontFamily: 'Medium',
                          fontSize: 16.sp,
                          color: cFirstColor),
                    ),
                    Container(
                        margin: const EdgeInsets.only(right: 18),
                        decoration: BoxDecoration(
                          color: cShopScreenColor,
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset('assets/icons/truck-fast.svg',
                                height: 10.h),
                            SizedBox(
                              width: 4.w,
                            ),
                            // const Text('±',textScaleFactor: 1,style:  TextStyle(wordSpacing: -100),),
                            Text(
                              '20min',
                              style: TextStyle(
                                  color: cFirstColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Medium'),
                            )
                          ],
                        ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Yetkazib berish',
                      style: TextStyle(
                          fontFamily: 'Medium',
                          fontSize: 12.sp,
                          color: cGreyColor),
                    ),
                    Text(
                      '5 000 UZS',
                      style: TextStyle(
                          fontFamily: 'Medium',
                          fontSize: 16.sp,
                          color: cFirstColor),
                    ),
                    Container(
                        // margin: const EdgeInsets.only(right: 18),
                        decoration: BoxDecoration(
                          color: cShopScreenColor,
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/location.svg',
                                height: 8.54.h, color: cFirstColor),
                            SizedBox(
                              width: 4.w,
                            ),
                            // const Text('±',textScaleFactor: 1,style:  TextStyle(wordSpacing: -100),),
                            Text(
                              '200m',
                              style: TextStyle(
                                  color: cFirstColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Medium'),
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container searchTextField(BuildContext context, FootItemsState state) {
    return Container(
        width: 280.w,
        margin: const EdgeInsets.only(left: 10),
        child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: ctextFieldColor,
                      borderRadius: BorderRadius.circular(15.r)),
                  width: 280.w,
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: 220.w,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: TextField(
                                autofocus: true,
                                onChanged: (value) {
                                  BlocProvider.of<FootItemsCubit>(context)
                                      .searchMaxsulot(value);
                                  setState(() {});
                                },
                                controller:
                                    BlocProvider.of<FootItemsCubit>(context)
                                        .state
                                        .filter,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'Medium',
                                  color: ctextColor,
                                ),
                                cursorColor: ctextColor,
                                decoration: InputDecoration(
                                    border: const UnderlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: 'Qidirish',
                                    hintStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: 'Medium',
                                      color: const Color(0xffE0E0E0),
                                    )),
                              ),
                            )),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    BlocProvider.of<FootItemsCubit>(context)
                                        .state
                                        .filter
                                        ?.clear();
                                    BlocProvider.of<FootItemsCubit>(context)
                                        .state
                                        .maxsulot = maxsulot_list;
                                    isActiveSearch = !isActiveSearch;
                                  });
                                },
                                child: const Icon(
                                  CupertinoIcons.clear,
                                  color: cBlackColor,
                                  size: 20,
                                )))
                      ]))
            ]));
  }

  Align buttonToBox(List<KorzinaCard> transaction, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 206.h,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: const [0, 0.2, 0.8],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  cWhiteColor.withOpacity(0),
                  cHomeBackgroundColor.withOpacity(0.72),
                  cHomeBackgroundColor.withOpacity(1),
                ])),
        child: Visibility(
          visible: transaction.isNotEmpty,
          child: Container(
              height: 65.h,
              margin:
                  EdgeInsets.only(right: 25, bottom: 22, left: 25, top: 118.h),
              child: ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {
                    setState(() {});
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        const KorzinaScreen(key: Key("korzina"),);
                        return  const HomePage(
                          currentIndex: 2,
                          key: Key('korzina'),

                        );
                      }),
                    );
                  },
                  child: Row(children: [
                    SvgPicture.asset(
                      'assets/icons/shopping_cart_d.svg',
                      color: cWhiteColor,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text('${transaction.length}',
                          style: TextStyle(
                              color: cWhiteColor.withOpacity(0.5),
                              fontSize: 14.sp,
                              fontFamily: 'Medium')),
                    ),
                    Text('$jamiSumma UZS',
                        style: TextStyle(
                            color: cWhiteColor,
                            fontSize: 16.sp,
                            fontFamily: 'Medium'))
                  ]))),
        ),
      ),
    );
  }
}
