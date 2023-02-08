import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mijoz_labbay/core/widgets/navigator.dart';
import 'package:mijoz_labbay/features/home_page/presentation/pages/home_page.dart';
import 'package:mijoz_labbay/features/korzina_screen/data/database/database.dart';
import 'package:mijoz_labbay/features/korzina_screen/domain/bloc/korzina_bloc.dart';
import 'package:mijoz_labbay/features/korzina_screen/prezentation/widgets/order_description_widget.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../data/korzina_hive/korzina_hive.dart';

class KorzinaScreen extends StatefulWidget {
  const KorzinaScreen({Key? key}) : super(key: key);

  @override
  State<KorzinaScreen> createState() => _KorzinaScreenState();
}

class _KorzinaScreenState extends State<KorzinaScreen> {
  @override
  Widget build(BuildContext context) {
    int jamiSumma = 0;
    return BlocProvider(
      create: (context) => KorzinaBloc(Database()),
      child: BlocBuilder<KorzinaBloc, KorzinaState>(builder: (context, state) {
        return ValueListenableBuilder<Box<KorzinaCard>>(
            valueListenable: Hive.box<KorzinaCard>('korzina_box').listenable(),
            builder: (context, box, _) {
              Hive.openBox<KorzinaCard>('korzina_box');
              var transaction = box.values.toList().cast<KorzinaCard>();
              for (int i = 0; i < transaction.length; i++) {
                jamiSumma += transaction[i].number * transaction[i].price;
              }
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
                                  if (keys == const Key('home')) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        FadeRoute2(
                                            const HomePage(currentIndex: 0)),
                                        (route) => false);
                                  } else {
                                    Navigator.pop(context);
                                  }
                                },
                                icon: SvgPicture.asset(
                                    'assets/icons/arrow-left.svg'),
                              ),
                              Text('Savatcha', style: textStyle16),
                              IconButton(
                                onPressed: null,
                                icon:
                                    SvgPicture.asset('assets/icons/trash.svg'),
                              )
                            ]))),
                body: Center(
                  child: transaction.isEmpty
                      ? Container()
                      : ListView(
                          reverse: transaction.length <= 2 ? false : true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    top: 24.h,
                                    right: 14.w,
                                    left: 14.w,
                                    bottom: 200),
                                decoration: BoxDecoration(
                                  color: cWhiteColor,
                                  borderRadius: BorderRadius.circular(22),
                                  boxShadow: [
                                    BoxShadow(
                                        color: cThirdColor.withOpacity(0.2)),
                                  ],
                                ),
                                child: Column(children: [
                                  buildBoxCard(transaction, box),
                                  SizedBox(
                                      width: 350.w,
                                      child: SvgPicture.asset(
                                          'assets/icons/line.svg',
                                          fit: BoxFit.fitWidth)),
                                  OrderDescriptionWidget(
                                      transaction: transaction),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 22.h,
                                          left: 23.w,
                                          right: 23.w,
                                          top: 10),
                                      child: Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Jami summa:',
                                              style: TextStyle(
                                                  color: ctext2Color,
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Medium'),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: '$jamiSumma ',
                                                  style: TextStyle(
                                                      color: cFirstColor,
                                                      fontSize: 24.sp,
                                                      fontFamily: 'Medium'),
                                                  children: [
                                                    TextSpan(
                                                        text: 'UZS',
                                                        style: TextStyle(
                                                            color: cFirstColor,
                                                            fontSize: 14.sp,
                                                            fontFamily:
                                                                'Medium'))
                                                  ]),
                                            ),
                                          ],
                                        ),
                                      ]))
                                ]))
                          ],
                        ),
                ),
                floatingActionButton: Visibility(
                  visible: transaction.isEmpty ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Buyurtma berish',
                          style: TextStyle(
                              fontFamily: 'Medium',
                              fontSize: 16.sp,
                              color: cWhiteColor),
                        ),
                        style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(Size.fromWidth(348.w)),
                          padding:
                              MaterialStateProperty.all(const EdgeInsets.all(25)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0.r))),
                          backgroundColor: MaterialStateProperty.all(cFirstColor),
                          elevation: MaterialStateProperty.all(0),
                        )),
                  ),
                ),
              );
            });
      }),
    );
  }

  SizedBox buildBoxCard(List<KorzinaCard> transaction, Box<KorzinaCard> box) {
    return SizedBox(
      height: transaction.length <= 2 ? transaction.length * 112.h : 285.h,
      child: Stack(
        children: [
          ListView.builder(
            // clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(
                left: 17,
                right: 17,
                bottom: transaction.length <= 2 ? 0 : 70,
                top: 21),
            itemCount: transaction.length,
            itemBuilder: (context, index) {
              KorzinaCard? card = box.getAt(index);
              return Container(
                  width: 314.w,
                  height: 87.h,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: cSecondColor,
                  ),
                  child: SlidableAutoCloseBehavior(
                    closeWhenTapped: true,
                    child: Slidable(
                      key: Key('${card?.id}'),
                      direction: Axis.horizontal,
                      endActionPane: ActionPane(
                        extentRatio: 0.19,
                        motion: const BehindMotion(),
                        dragDismissible: false,
                        children: [
                          InkWell(
                            onTap: () async {
                              setState(() {});
                              card?.delete();
                            },
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(15)),
                            child: Container(
                              width: 60.w,
                              height: 87.h,
                              decoration: const BoxDecoration(
                                  color: cFirstColor,
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(15))),
                              child: const Icon(
                                Icons.delete,
                                color: cWhiteColor,
                              ),
                            ),
                          ),

                          // ElevatedButton(onPressed: (){}, child: Icon(Icons.delete)),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 67.w,
                            height: 67.h,
                            margin: const EdgeInsets.all(11),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: cWhiteColor),
                            child: Image.asset('${card?.image}'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 12.h),
                                child: SizedBox(
                                  width: 150.w,
                                  child: AutoSizeText(
                                    card?.title ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyleBlack16,
                                  ),
                                ),
                              ),
                              Text(
                                '${card?.price} so’m',
                                style: TextStyle(
                                    color: ctext2Color,
                                    fontSize: 13.sp,
                                    fontFamily: 'Medium'),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 19.0.w),
                            child: Text(
                              'x${card?.number}',
                              style: TextStyle(
                                  color: cFirstColor,
                                  fontSize: 16.sp,
                                  fontFamily: 'Medium'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
          Visibility(
            visible: transaction.length <= 2 ? false : true,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 90.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        stops: const [0, 0.1, 0.8],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          cWhiteColor.withOpacity(0),
                          cHomeBackgroundColor.withOpacity(0.52),
                          cHomeBackgroundColor.withOpacity(1),
                        ])),
              ),
            ),
          )
        ],
      ),
    );
  }
}
