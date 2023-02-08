import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_constants.dart';
import '../../data/korzina_hive/korzina_hive.dart';

class OrderDescriptionWidget extends StatelessWidget {
  const OrderDescriptionWidget({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final List<KorzinaCard> transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.symmetric(vertical: 10),
        title: Text(
          'Buyurtma tafsilotlari:',
          style: TextStyle(
              color: ctext2Color, fontSize: 14.sp, fontFamily: 'Medium'),
        ),
        // collapsedIconColor: ,
        iconColor: cFirstColor,
        children: [
          ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: transaction.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          "${transaction[index].title} fdfdsfsdfdsf",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: ctextColor,
                              fontSize: 14.sp,
                              fontFamily: 'Medium'),
                        ),
                      ),
                      Text(
                        '${transaction[index].number} x ${transaction[index].price} UZS',
                        style: TextStyle(
                            color: ctextColor,
                            fontSize: 14.sp,
                            fontFamily: 'Medium'),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
