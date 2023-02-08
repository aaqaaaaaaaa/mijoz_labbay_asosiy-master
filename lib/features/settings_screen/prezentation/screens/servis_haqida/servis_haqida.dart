import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/features/settings_screen/prezentation/screens/litsenziya_va_shartnoma.dart';
import 'package:mijoz_labbay/features/settings_screen/prezentation/screens/qollab_quvvatlash.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../settings_screen.dart';


class ServisHaqida extends StatefulWidget {
  const ServisHaqida({Key? key}) : super(key: key);

  @override
  _ServisHaqidaState createState() => _ServisHaqidaState();
}

class _ServisHaqidaState extends State<ServisHaqida> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cHomeBackgroundColor,
      appBar: AppBar(
        shadowColor: cThirdColor.withOpacity(0.2),
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
                  Navigator.pop(context);
                  // Navigator.push(context,

                  //     FadeRoute2(const HomePage(currentIndex: 3,)));
                },
                icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
              ),
              Text(
                'Servis haqida',
                style: textStyle16,
              ),
              IconButton(onPressed: null, icon: Container())
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 44.0.h, bottom: 12.h),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/logo.svg'),
                    SizedBox(
                      height: 6.34.h,
                    ),
                    Text(
                      'версия 1.95',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: cGrayColor,
                          fontFamily: 'Medium',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '© 2020 “IMSOFT GROUP”',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: cGrayColor,
                          fontFamily: 'Medium',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                    style: settingsButtonStyle,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LitsenziyaScreen(),
                          ));
                    },
                    child: const SettingsButtons(
                      subtitle: null,
                      title: 'Litsenziya va shartnoma',
                      image: 'assets/icons/rankinglitsenziya.svg',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                    style: settingsButtonStyle,
                    onPressed: () {},
                    child: const SettingsButtons(
                      subtitle: null,
                      title: 'Hamkor bo’lish',
                      image: 'assets/icons/verifyhamkorBolish.svg',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                    style: settingsButtonStyle,
                    onPressed: () {},
                    child: const SettingsButtons(
                      subtitle: null,
                      title: 'Kuryer bo’lish',
                      image: 'assets/icons/truck-tickkuryerBolish.svg',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                    style: settingsButtonStyle,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const QollabQuvvatlashScreen(),
                          ));
                    },
                    child: const SettingsButtons(
                      subtitle: null,
                      title: 'Qo’llab quvvatlash',
                      image: 'assets/icons/headphoneqollabQuvvatlash.svg',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                    style: settingsButtonStyle,
                    onPressed: () {},
                    child: const SettingsButtons(
                      subtitle: null,
                      title: 'Ilovani baholash',
                      image: 'assets/icons/likeilIlovani baholash.svg',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                    style: settingsButtonStyle,
                    onPressed: () {},
                    child: const SettingsButtons(
                      subtitle: null,
                      title: 'Biz haqimizda',
                      image: 'assets/icons/info-circleBiz haqimizda.svg',
                    )),
              ),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
