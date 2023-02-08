import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/features/check_hudud/presentation/pages/check_hudud.dart';
import 'package:mijoz_labbay/features/login/presentation/pages/login_page.dart';
import 'package:mijoz_labbay/features/on_boarding/domain/model/onboarding_model.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  PageController controller = PageController(initialPage: 0);
///shu yerni screen shot qiling
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage.screen(),
            ));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              currentIndex != 0
                  ? controller.jumpToPage(currentIndex -= 1)
                  : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage.screen(),
                  ));
            },
            icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Hudud(),
                      ));
                },
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "O'tkazib yuborish",
                    style: TextStyle(
                        color: const Color(0xffB9B9B9),
                        fontFamily: 'Medium',
                        fontSize: 14.sp),
                  ),
                ))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: contents.length,
                itemBuilder: (_, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34.0),
                        child: Text(
                          contents[index].text,
                          textAlign: TextAlign.center,
                          style: textStyle16,
                        ),
                      ),
                      const SizedBox(
                        height: 130,
                      ),
                      SvgPicture.asset(contents[index].image),
                    ],
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    contents.length, (index) => buildDot(context, index)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: ElevatedButton(
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Hudud(),
                        ));
                  }
                  controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInCirc);
                },
                child: const Text('Davom etish'),
                style: buttonStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(BuildContext context, int index) {
    return Container(
      height: currentIndex == index ? 10.7.h : 7.h,
      width: currentIndex == index ? 10.7.w : 7.w,
      margin: const EdgeInsets.only(right: 9),
      decoration: BoxDecoration(
          color: currentIndex == index ? cFirstColor : cSecondColor,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
