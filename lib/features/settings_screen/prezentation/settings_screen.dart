import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/core/widgets/navigator.dart';
import 'package:mijoz_labbay/features/home_page/presentation/pages/home_page.dart';
import 'package:mijoz_labbay/features/hudud_map/presentation/pages/hudud_map.dart';
import 'package:mijoz_labbay/features/settings_screen/prezentation/screens/servis_haqida/servis_haqida.dart';
import 'package:mijoz_labbay/features/settings_screen/prezentation/screens/tilni_ozgartirish_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      FadeRoute2(
                        const HomePage(currentIndex: 0),
                      ),
                      (route) => false);
                },
                icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
              ),
              Text(
                'Profil va sozlamalar',
                style: textStyle16,
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/logout.svg'))
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
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Container(
                    width: 300,
                    child: Text(
                      'Jakhongir Sagatov',
                        textAlign: TextAlign.center,
                      style: TextStyle(
                          color: cFirstColor,
                          fontFamily: 'Medium',
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ElevatedButton(
                      style: settingsButtonStyle,
                      onPressed: () {},
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: SvgPicture.asset(
                                  'assets/icons/callphoneIcon.svg')),
                          Padding(
                            padding: const EdgeInsets.only(left: 21.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Telefon raqam', style: textStyle16),
                                Text('+998(33) 510-95-95',
                                    style: textSubtitleStyle12),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ElevatedButton(
                      style: settingsButtonStyle,
                      onPressed: () {},
                      child: const SettingsButtons(
                        subtitle: null,
                        title: 'Region',
                        image: 'assets/icons/settingsRegionIcon.svg',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ElevatedButton(
                      style: settingsButtonStyle,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HududMap(),));
                      },
                      child: const SettingsButtons(
                        subtitle: null,
                        title: 'Manzil',
                        image: 'assets/icons/locationSettingsManzilIcon.svg',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ElevatedButton(
                      style: settingsButtonStyle,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                const TilniUzgartirishDialog());
                      },
                      child: const SettingsButtons(
                        subtitle: null,
                        title: 'Til o’zgartirish',
                        image:
                            'assets/icons/translatesettingsTranslatorIcon.svg',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ElevatedButton(
                      style: settingsButtonStyle,
                      onPressed: () {
                        Navigator.push(
                            context,
                            FadeRoute2(
                              const ServisHaqida(),
                            ));
                      },
                      child: const SettingsButtons(
                        subtitle: null,
                        title: 'Servis haqida',
                        image: 'assets/icons/lifebuoySettingsServisIcon.svg',
                      )),
                ),
                SizedBox(height: 100.h),
              ],
            )),
      ),
    );
  }
}

class SettingsButtons extends StatelessWidget {
  const SettingsButtons({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String image, title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: SvgPicture.asset(image,width: 24.w,height: 24.h,)),
        Padding(
          padding: const EdgeInsets.only(left: 21.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: textStyle16),
              subtitle == null
                  ? Container()
                  : Text(subtitle!, style: textSubtitleStyle12),
            ],
          ),
        )
      ],
    );
  }
}
