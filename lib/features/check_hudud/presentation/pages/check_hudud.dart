import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/features/check_hudud/presentation/widgets/hudud_widget.dart';
import 'package:mijoz_labbay/features/hudud_map/presentation/pages/hudud_map.dart';

class Hudud extends StatefulWidget {
  const Hudud({Key? key}) : super(key: key);

  @override
  _HududState createState() => _HududState();
}

class _HududState extends State<Hudud> {
  DateTime? currentBackPressTime;

  List isNotCheck = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  List hudud = [
    "Andijon",
    "Farg'ona",
    "Namangan",
    "Toshkent",
    "Buxoro",
    "Sirdaryo",
    "Jizzax",
    "Xorazm",
    "Surhandaryo",
    "Qashqadaryo",
    "Qoraqalpog\'iston",
    "Navoiy",
    "Samarqand",
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) >
                const Duration(seconds: 2)) {
          currentBackPressTime = now;
          Fluttertoast.showToast(
              msg: "Dasturdan chiqish uchun ikki marta bosing!");
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 68.h,
            ),
            SizedBox(
              height: 610.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: hudud.length,
                itemBuilder: (context, index) => GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    isNotCheck[index] = !isNotCheck[index];
                    setState(() {});
                  },
                  child: HududWidget(
                    isNotChecked: isNotCheck[index],
                    hudud: hudud[index],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HududMap()),
                );
              },
              child: const Text('Davom etish'),
              style: buttonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
