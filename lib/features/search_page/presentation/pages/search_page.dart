import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/features/search_page/domain/bloc/footitems_cubit.dart';
import 'package:mijoz_labbay/features/search_page/presentation/widgets/search_footItems.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchFootItemsCubit(maxsulotlarBulimiCubit: []),
      child: BlocBuilder<SearchFootItemsCubit, SearchFootItemsState>(
        builder: (context, state) {
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
              title: Container(
                width: 325.w,
                margin: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                        height: 65,
                        decoration: BoxDecoration(
                            color: ctextFieldColor,
                            borderRadius: BorderRadius.circular(15)),
                        width: 325.w,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 19.0),
                              child: SvgPicture.asset(
                                  'assets/icons/search_icon.svg'),
                            ),
                            SizedBox(
                                width: 250.w,
                                child: TextField(
                                  onChanged: (value) {
                                    BlocProvider.of<SearchFootItemsCubit>(
                                            context)
                                        .searchMaxsulot(value);
                                    setState(() {});
                                  },
                                  controller:
                                      BlocProvider.of<SearchFootItemsCubit>(
                                              context)
                                          .state
                                          .filter,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Medium',
                                    color: ctextColor,
                                  ),
                                  cursorColor: ctextColor,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide.none),
                                      hintText: 'Qidirish',
                                      hintStyle: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: 'Medium',
                                        color: Color(0xffE0E0E0),
                                      )),
                                ))
                          ],
                        )),
                  ],
                ),
              ),
            ),
            body: Stack(
              children: [
                Center(
                    child: SvgPicture.asset(
                        'assets/images/search_backgroundImage.svg')),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.maxsulot.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => SearchFootItems(
                      description: state.maxsulot[index].description,
                      // number: state.maxsulot[index].,
                      image: state.maxsulot[index].image,
                      id: state.maxsulot[index].id,
                      tayyorlanishVaqti:
                          state.maxsulot[index].tayyorlanishVaqti,
                      // number: transaction[index].number,
                      tarkibi: state.maxsulot[index].tarkibi,
                      nomi: state.maxsulot[index].title,
                      narxi: state.maxsulot[index].price,
                      oshxonaNomi: state.maxsulot[index].oshxonaNomi,
                    ),
                  ),
                ),
              ],
            ),
            // bottomNavigationBar: Container(
            //   margin: const EdgeInsets.all(10),
            //   height: 65,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(22),
            //   ),
            //   child: ListView.builder(
            //     itemCount: 4,
            //     scrollDirection: Axis.horizontal,
            //     padding: EdgeInsets.symmetric(
            //         horizontal: MediaQuery.of(context).size.width * .05),
            //     itemBuilder: (context, index) => InkWell(
            //       onTap: () {
            //         setState(() {
            //           currentIndex = index;
            //           Navigator.pushAndRemoveUntil(
            //               context,
            //               FadeRoute2(
            //                 HomePage(currentIndex: currentIndex),
            //               ),
            //               (route) => false);
            //         });
            //       },
            //       splashColor: Colors.transparent,
            //       highlightColor: Colors.transparent,
            //       child: Container(
            //         width: MediaQuery.of(context).size.width * .2125,
            //         alignment: Alignment.center,
            //         child: SvgPicture.asset(index == currentIndex
            //             ? listOfActiveIcons[index]
            //             : listOfInactiveIcons[index]),
            //       ),
            //     ),
            //   ),
            // ),
          );
        },
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   BlocProvider.of<SearchFootItemsCubit>(context).state.filter?.dispose();
  // }
}
