// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'dart:ui';
import 'menu_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/features/korzina_screen/data/database/database.dart';
import 'package:mijoz_labbay/features/korzina_screen/data/korzina_hive/korzina_hive.dart';
import 'package:mijoz_labbay/features/korzina_screen/domain/bloc/korzina_bloc.dart';

class ItemDialog extends StatefulWidget {
  const ItemDialog({
    Key? key,
    required this.title,
    // required this.number,
    required this.price,
    required this.description,
    required this.image,
    required this.hajmi,
    required this.izoh,
    required this.id,
    required this.tarkibi,
    required this.oshxonaNomi,
    required this.jamiSumma,
  }) : super(key: key);
  final String title;
  final String description;

  final String image;
  final String tarkibi;
  final String oshxonaNomi;
  final int price;
  final int jamiSumma;
  final int id;
  final List izoh;
  final List hajmi;

  @override
  _ItemDialogState createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
  List selected = [];
  List selectedOne = [];
  int count = 1;
  bool isIzohActive = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KorzinaBloc(Database()),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Dialog(
                  alignment: Alignment.bottomCenter,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.r)),
                  insetPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: BlocBuilder<KorzinaBloc, KorzinaState>(
                    builder: (context, state) {
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.r)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: cSecondColor,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(22.r)),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(22.r)),
                                        child: Image.asset(widget.image,
                                            height: 214.h,
                                            width: 340.w,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(22.r),
                                      onTap: () => setState(
                                          () => Navigator.pop(context, state)),
                                      child: Container(
                                          margin: const EdgeInsets.all(11),
                                          alignment: Alignment.center,
                                          width: 22.w,
                                          height: 22.h,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: cWhiteColor,
                                          ),
                                          child: Icon(Icons.clear,
                                              size: 12.sp, color: cFirstColor)),
                                    )
                                  ],
                                ),
                                dialogContent(context)
                              ]));
                    },
                  )))),
    );
  }

  Padding dialogContent(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25.0.w, top: 18.h),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.title,
                  style: TextStyle(
                      fontFamily: 'SemiBold',
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              Text(
                '${widget.price} so’m',
                style: TextStyle(
                    fontFamily: 'Medium',
                    fontSize: 14.sp,
                    color: cFirstColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 24.h),
              Text('Izoh:', style: textStyleBlack13),
              SizedBox(height: 12.h),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 50.w,
                  margin: const EdgeInsets.only(right: 12),
                  child: ElevatedButton(
                    onPressed: () =>
                        setState(() => isIzohActive = !isIzohActive),
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(50.w, 50.h)),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        backgroundColor: MaterialStateProperty.all(
                            isIzohActive ? cFirstColor : cSecondColor)),
                    child: SvgPicture.asset(isIzohActive
                        ? 'assets/icons/chaticonactive.svg'
                        : 'assets/icons/chat_icon.svg'),
                  ),
                ),
                SizedBox(
                    width: 238.w,
                    height: 50.h,
                    child: isIzohActive
                        ? Container(
                            margin: EdgeInsets.only(right: 22.h),
                            padding: EdgeInsets.only(left: 22.w, top: 2.h),
                            width: 218.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: cSecondColor,
                                borderRadius: BorderRadius.circular(25.r)),
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'Medium',
                                  color: cFirstColor),
                              cursorColor: cFirstColor,
                              decoration: InputDecoration(
                                  border: const UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: 'Izoh',
                                  hintStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: 'Medium',
                                      color: cFirstColor)),
                            ))
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: items.length,
                            itemBuilder: (context, index) =>
                                _buildChip(widget.hajmi[index], index)))
              ]),
              SizedBox(height: 24.h),
              Text('Hajmi:', style: textStyleBlack13),
              SizedBox(height: 12.h),
              Container(
                  alignment: Alignment.center,
                  height: 50.h,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: itemOne.length,
                      itemBuilder: (context, index) =>
                          _buildChipOne(widget.izoh[index], index))),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 24.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (count > 1) setState(() => count--);
                          },
                          child: const Icon(Icons.remove, color: cFirstColor),
                          style: ButtonStyle(
                              fixedSize:
                                  MaterialStateProperty.all(Size(74.w, 50.h)),
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                      side: BorderSide(
                                          color: cFirstColor, width: 1.w)))),
                        ),
                        Container(
                            width: 38,
                            margin: const EdgeInsets.symmetric(horizontal: 21),
                            child: Text('$count',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ctextColor,
                                    fontFamily: 'Regular',
                                    fontSize: 20.sp))),
                        ElevatedButton(
                          onPressed: () => setState(() => count++),
                          child: const Icon(
                            Icons.add,
                            color: cFirstColor,
                          ),
                          style: ButtonStyle(
                              fixedSize:
                                  MaterialStateProperty.all(Size(74.w, 50.h)),
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                      side: BorderSide(
                                          color: cFirstColor, width: 1.w)))),
                        ),
                        SizedBox(width: 25.w)
                      ])),
              Container(
                margin: const EdgeInsets.only(right: 25, bottom: 22),
                child: ElevatedButton(
                  style: buttonStyle,
                  onPressed: () async {
                    if (selected.isNotEmpty && selectedOne.isNotEmpty) {
                      final korzinagaQushilyayotganMaxsulot = KorzinaCard(
                          description: widget.description,
                          title: widget.title,
                          image: widget.image,
                          number: count,
                          id: widget.id,
                          price: widget.price,
                          izoh: selected,
                          hajmi: selectedOne,
                          tarkibi: widget.tarkibi,
                          oshxonaNomi: widget.oshxonaNomi,
                          jamiSumma: widget.jamiSumma);

                      final box =
                          await Hive.openBox<KorzinaCard>('korzina_box');

                      ///korzinaga qo'shyapti
                      box.put(widget.id, korzinagaQushilyayotganMaxsulot);

                      Navigator.pop(context);
                      Fluttertoast.showToast(msg: 'Муваффакиятли сакланди');
                    }
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/add_icon.svg'),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text('Qo’shish',
                            style: TextStyle(
                                color: cWhiteColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Medium')),
                      ),
                      Text('${widget.price * count} UZS',
                          style: TextStyle(
                              color: cWhiteColor,
                              fontSize: 16.sp,
                              fontFamily: 'Medium'))
                    ],
                  ),
                ),
              )
            ]));
  }

  Widget _buildChip(String label, int index) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      child: ElevatedButton(
        child: Text(label,
            style: selected.contains(index) ? textStyleWhite16 : textStyle16),
        onPressed: () {
          if (selected.contains(index)) {
            setState(() => selected.remove(index));
          } else {
            setState(() => selected.add(index));
          }
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 17.w),
            ),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r))),
            backgroundColor: MaterialStateProperty.all(
                selected.contains(index) ? cFirstColor : cSecondColor)),
      ),
    );
  }

  Widget _buildChipOne(String label, int index) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      child: ElevatedButton(
        child: Text(label,
            style: selectedOne.contains(index)
                ? TextStyle(
                    fontSize: 16.sp, fontFamily: 'Medium', color: cWhiteColor)
                : textStyle16),
        onPressed: () {
          if (selectedOne.contains(index)) {
            setState(() => selectedOne.clear());
          } else {
            setState(() {});
            selectedOne.clear();
            selectedOne.add(index);
          }
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 31.w),
            ),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r))),
            backgroundColor: MaterialStateProperty.all(
                selectedOne.contains(index) ? cFirstColor : cSecondColor)),
      ),
    );
  }
}
//
// onPressed: () {
// print('putAt0');
// final korzinagaQushilyayotganMaxsulot = KorzinaCard(
// description: widget.description,
// title: widget.title,
// image: widget.image,
// number: count,
// id: widget.id,
// price: widget.price,
// izoh: selected,
// hajmi: selectedOne,
// tarkibi: widget.tarkibi,
// oshxonaNomi: widget.oshxonaNomi,
// jamiSumma: widget.jamiSumma);
// // if(box.)
// // box.pu
// final box = Hive.box<KorzinaCard>('korzina_box');
// dynamic desiredKey;
// final Map<dynamic, KorzinaCard> korzinaMap = box.toMap();
// korzinaMap.forEach((key, value) {
// if (value.id == widget.id) {
// box.putAt(key, value);
// print('putAt');
// box.delete(desiredKey);
// } else {
// box.add(korzinagaQushilyayotganMaxsulot);
// Navigator.of(context).pushAndRemoveUntil(
// FadeRoute2(ShopScreen(
// oshxonaNomi: widget.oshxonaNomi,
// )),
// (route) => false);
// Fluttertoast.showToast(msg: 'Муваффакиятли сакланди');
// print('putAt1');
// }
// });
//
// // }
// print('putAt2');
// // print(box.keys);
// // Navigator.pushAndRemoveUntil(context);
// },
