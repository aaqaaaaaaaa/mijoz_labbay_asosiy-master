
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/features/korzina_screen/data/database/database.dart';
import 'package:mijoz_labbay/features/korzina_screen/data/korzina_hive/korzina_hive.dart';
import 'package:mijoz_labbay/features/korzina_screen/domain/bloc/korzina_bloc.dart';
import 'package:mijoz_labbay/features/shop_page/presentation/widgets/dialog.dart';
import 'package:mijoz_labbay/features/shop_page/presentation/widgets/menu_items.dart';

class SearchFootItems extends StatefulWidget {
  const SearchFootItems({
    Key? key,
    required this.tarkibi,
    required this.image,
    required this.description,
    required this.narxi,
    required this.nomi,
    required this.oshxonaNomi,
    required this.tayyorlanishVaqti,
    // required this.number,
    required this.id,
  }) : super(key: key);
  final String nomi;
  final String tarkibi;
  final String image;
  final String oshxonaNomi;
  final int narxi;
  final String tayyorlanishVaqti;
  final String description;
  // final int number;
  final int id;

  @override
  _SearchFootItemsState createState() => _SearchFootItemsState();
}

class _SearchFootItemsState extends State<SearchFootItems> {
  final int jamiSumma = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324.w,
      height: 120.h,
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 6.h),
      decoration: BoxDecoration(
          color: cWhiteColor, borderRadius: BorderRadius.circular(15.r)),
      child:
          // InkWell(
          // onTap: ()=>
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       final transaction = box.values.toList().cast<ElementCard>();
          //       return ItemDialog(
          //       id: ,
          //     );
          //     }),
          // child:
          Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset('assets/images/vaqtinchalik/scale_1200 1.png',
                  width: 94, height: 94, fit: BoxFit.cover),
            ),
          ),
          BlocProvider(
            create: (context) => KorzinaBloc(Database()),
            child: ValueListenableBuilder<Box<KorzinaCard>>(
              valueListenable:
                  Hive.box<KorzinaCard>('korzina_box').listenable(),
              builder: (context, box, _) {
                return InkWell(
                  onTap: () async {
                    await openDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7.0, vertical: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.nomi,
                          style:  TextStyle(
                              color: cbulimTextColor,
                              fontSize: 14.sp,
                              fontFamily: 'Medium'),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 4),
                          constraints: BoxConstraints(maxWidth: 177.w),
                          child: Text(
                            widget.tarkibi,
                            style:  TextStyle(
                                color: cGrayColor,
                                fontSize: 10.sp,
                                fontFamily: 'Medium'),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 7),
                          constraints: BoxConstraints(maxWidth: 177.w),
                          child: Text(
                            widget.oshxonaNomi,
                            style:  TextStyle(
                                color: cGreyColor,
                                fontSize: 8.sp,
                                fontFamily: 'Medium'),
                          ),
                        ),
                        Text(
                          '${widget.narxi} UZS',
                          style: const TextStyle(
                              color: cFirstColor,
                              fontSize: 14,
                              fontFamily: 'Medium'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      // ),
    );
  }

  Future openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return ItemDialog(
          description: widget.description,
          id: widget.id,
          oshxonaNomi: widget.oshxonaNomi,
          tarkibi: widget.tarkibi,
          image: widget.image,
          jamiSumma: jamiSumma,
          title: widget.nomi,
          price: widget.narxi,
          // number: widget.number,
          hajmi: items,
          izoh: itemOne,
        );
      });
}
