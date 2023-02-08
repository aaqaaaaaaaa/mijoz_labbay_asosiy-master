import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';

List<String> items = [
  'Burger',
  'Laster',
  'Hod-Dog',
  'Chiken',
  'Salatlar',
  'Salatlar',
];List<String> itemOne = [
  '2.0',
  '2.1',
  '2.2',
  '2.3',
  '2.4',
  '2.5',
];

class MenuItems extends StatefulWidget {
  const MenuItems({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          for (int i = 0; i < items.length; i++) {}
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            items[widget.id],
            style: TextStyle(
                color: widget.id == 1 ? cShopTextColor : cGreyColor,
                fontSize: 14.sp,
                fontFamily: 'Medium'),
          ),
        ));
  }
}
