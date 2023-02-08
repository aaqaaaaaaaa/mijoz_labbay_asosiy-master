// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/features/korzina_screen/data/korzina_hive/korzina_hive.dart';
import 'package:mijoz_labbay/features/shop_page/presentation/widgets/menu_items.dart';

class KorzinaCardModel extends StatefulWidget {
  const KorzinaCardModel({
    Key? key,
    required this.number,
    required this.image,
    required this.title,
    required this.price,
    required this.id,
  }) : super(key: key);
  final String? title;
  final String? image;
  final int? price;
  final int? id;
  final int? number;

  @override
  _KorzinaCardModelState createState() => _KorzinaCardModelState();
}

class _KorzinaCardModelState extends State<KorzinaCardModel> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box<KorzinaCard>('korzina_box');
    KorzinaCard? cad = box.getAt(widget.id!);
    return Container(
        width: 314.w,
        height: 87.h,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: cSecondColor,
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
              child: Image.asset(widget.image!),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: SizedBox(
                    width: 150,
                    child: AutoSizeText(
                      widget.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBlack16,
                    ),
                  ),
                ),
                Text(
                  '${widget.price!} so’m',
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
                'x${widget.number!}',
                style: TextStyle(
                    color: cFirstColor,
                    fontSize: 16.sp,
                    fontFamily: 'Medium'),
              ),
            ),
          ],
        ));
  }
}

class Maxsulotlar {
  final String title;
  final String image;
  final String tarkibi;
  final int price;
  final int id;
  final List izoh;
  final List hajmi;

  final String tayyorlanishVaqti;
  final String description;
  final String oshxonaNomi;

  Maxsulotlar({
    required this.title,
    required this.image,
    required this.description,
    required this.tayyorlanishVaqti,
    required this.oshxonaNomi,
    required this.price,
    required this.tarkibi,
    required this.id,
    required this.izoh,
    required this.hajmi,
  });
}

List<Maxsulotlar> maxsulot_list = [
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 0,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [itemOne],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 1,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chikenfdsafdsfsssssaaaaa',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 2,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 3,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chikenfdsaaaaaadsfa',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 4,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 5,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chikenfdsafdsfsssssa',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 6,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 7,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 8,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 9,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 10,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 11,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 12,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 13,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 14,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 15,
  ),
  Maxsulotlar(
    description: 'description',
    oshxonaNomi: 'Les Ailes',
    tayyorlanishVaqti: '20-30',
    tarkibi:
        'Ikki pishloq, barbekyu sousi, suvli pomidor, qalin mayonezli jo\'xori unili nonda pishirilgan mazali...',
    izoh: [items],
    hajmi: [1, 2, 3, 4, 5, 6],
    title: 'Chiken',
    image: 'assets/images/vaqtinchalik/scale_1200 1.png',
    price: 15000,
    id: 16,
  ),
];
