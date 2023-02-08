import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/features/login/domain/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Widget screen() => BlocProvider(
        create: (context) => LoginBloc(context),
        child: const LoginPage(),
      );

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc bloc;
  TextEditingController tel = TextEditingController();
  TextEditingController kod = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void dispose() {
    bloc.close();
    kod.dispose();
    tel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginInitial) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 35.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        SvgPicture.asset(
                          "assets/icons/app_logo.svg",
                          color: cFirstColor,
                          width: 205.w,
                          height: 55.h,
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(cRadius15.r),
                            color: cWhiteColor,
                            boxShadow: const [
                              BoxShadow(color: cFirstColor, spreadRadius: 1),
                            ],
                          ),
                          height: 65.h,
                          padding: EdgeInsets.fromLTRB(15.w, 2.h, 5.w, 0.h),
                          child: Center(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/callphoneIcon.svg',
                                  width: 20.w,
                                  height: 20.h,
                                  color: cTextFieldIcnColor,
                                ),
                                SizedBox(
                                  width: 17.w,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.top,
                                    keyboardType: TextInputType.phone,
                                    cursorColor: cFirstColor,
                                    controller: tel,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 0),
                                      hintText: "Telefon raqam",
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              cHintTextColor.withOpacity(0.3),
                                          fontFamily: "Regular"),
                                      prefixIconConstraints: BoxConstraints(
                                        maxWidth: 30.w,
                                        maxHeight: 30.h,
                                        minHeight: 25.h,
                                        minWidth: 25.w,
                                      ),
                                    ),
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: cFirstColor,
                                        fontFamily: "Regular"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            bloc.add(IsLoginEvent(tel.text));
                          },
                          child: const Text('Kirish'),
                          style: buttonStyle,
                        ),
                        const Spacer(),
                        Text(
                          "© Barcha huquqlar himoyalangan",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: cFirstColor,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  );
                } else if (state is SignIn) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 35.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        SvgPicture.asset(
                          "assets/icons/app_logo.svg",
                          color: cFirstColor,
                          width: 205.w,
                          height: 55.h,
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(cRadius15.r),
                            color: cWhiteColor,
                            boxShadow: const [
                              BoxShadow(color: cFirstColor, spreadRadius: 1),
                            ],
                          ),
                          height: 65.h,
                          padding: EdgeInsets.fromLTRB(18.w, 2.h, 5.w, 0.h),
                          child: Center(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/callphoneIcon.svg',
                                  width: 20.w,
                                  height: 20.h,
                                  color: cTextFieldIcnColor,
                                ),
                                SizedBox(
                                  width: 17.w,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.top,
                                    keyboardType: TextInputType.phone,
                                    cursorColor: cFirstColor,
                                    controller: tel,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                      const EdgeInsets.only(bottom: 0),
                                      hintText: "Telefon raqam",
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          color:
                                              cHintTextColor.withOpacity(0.3),
                                          fontFamily: "Regular"),
                                      prefixIconConstraints: BoxConstraints(
                                        maxWidth: 30.w,
                                        maxHeight: 30.h,
                                        minHeight: 25.h,
                                        minWidth: 25.w,
                                      ),
                                    ),
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: cFirstColor,
                                        fontFamily: "Regular"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 220.w,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(cRadius15.r),
                                    color: cWhiteColor,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: cFirstColor, spreadRadius: 1),
                                    ],
                                  ),
                                  height: 65.h,
                                  padding:
                                      EdgeInsets.fromLTRB(18.w, 2.h, 5.w, 0.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          cursorColor: cFirstColor,
                                          controller: kod,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Kod",
                                            hintStyle: TextStyle(
                                                fontSize: 14.sp,
                                                color: cHintTextColor
                                                    .withOpacity(0.3),
                                                fontFamily: "Regular"),
                                          ),
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: cFirstColor,
                                              fontFamily: "Regular"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "00:59",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: cTextColor,
                                    fontFamily: 'Medium'
                                  ),
                                ),
                                SvgPicture.asset(
                                  "assets/icons/refresh.svg",
                                  color: cFirstColor,
                                  width: 22.w,
                                  height: 22.h,
                                ),
                                SizedBox(width: 0.w,)
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            bloc.add(IsLoginEvent(tel.text));
                          },
                          child: const Text('Kirish'),
                          style: buttonStyle,
                        ),
                        const Spacer(),
                        Text(
                          "© Barcha huquqlar himoyalangan",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: cFirstColor,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  );
                } else if (state is LoginFailed) {
                  return const Center(
                    child: Text("Tizimga kirishda xatolik"),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
