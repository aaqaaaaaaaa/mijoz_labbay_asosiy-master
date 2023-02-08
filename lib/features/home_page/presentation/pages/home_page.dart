import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/features/korzina_screen/prezentation/korzina_screen.dart';
import 'package:mijoz_labbay/features/order_screen/prezentation/order_screen.dart';
import 'package:mijoz_labbay/features/settings_screen/prezentation/settings_screen.dart';

import 'magazin_screen/magazin_screen.dart';
Key keys= const Key('value');
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const HomePage(
      currentIndex: 0,
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.currentIndex}) : super(key: key);
  final int? currentIndex;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexPage = 0;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    indexPage = widget.currentIndex ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
        backgroundColor: cHomeBackgroundColor,
        body: screens[indexPage],
        floatingActionButton: bottomNavBar(screenWidth),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Container bottomNavBar(double screenWidth) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 74.h,
      decoration: BoxDecoration(
        color: cWhiteColor,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() => indexPage = index);
            keys= const Key('home');
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            width: screenWidth * .2125,
            alignment: Alignment.center,
            child: SvgPicture.asset(
                index == indexPage
                    ? listOfActiveIcons[index]
                    : listOfInactiveIcons[index],
                width: 28.w,
                height: 28.h),
          ),
        ),
      ),
    );
  }
}

List<String> listOfInactiveIcons = [
  'assets/icons/shop_deactive.svg',
  'assets/icons/clock_d.svg',
  'assets/icons/shopping_cart_d.svg',
  'assets/icons/setting_d.svg',
];
List<String> listOfActiveIcons = [
  'assets/icons/shop.svg',
  'assets/icons/clock.svg',
  'assets/icons/shopping-cart.svg',
  'assets/icons/setting.svg',
];
List<Widget> screens = [
  MagazinScreen.screen(),
  const OrderScreen(),
  const KorzinaScreen(key: Key('home')),
  const SettingsScreen(),
];
