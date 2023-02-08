import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:mijoz_labbay/core/utils/app_constants.dart';
import 'package:mijoz_labbay/features/check_hudud/presentation/pages/check_hudud.dart';
import 'package:mijoz_labbay/features/home_page/presentation/pages/home_page.dart';
import 'package:mijoz_labbay/features/hudud_map/domain/bloc/hudud_map_bloc.dart';
import 'package:mijoz_labbay/features/hudud_map/presentation/widgets/parse.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HududMap extends StatefulWidget {
  const HududMap({Key? key}) : super(key: key);

  static Widget screen() => BlocProvider(
        create: (context) => HududMapBloc(),
        child: const HududMap(),
      );

  @override
  _HududMapState createState() => _HududMapState();
}

class _HududMapState extends State<HududMap> {
  late YandexMapController controller;
  final List<MapObject> mapObjects = [];
  final MapObjectId placemarkId = const MapObjectId('normal_icon_placemark');
  Location location = Location();
  LocationData? currentPosition;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
        body: Stack(
          children: [
            YandexMap(
              tiltGesturesEnabled: true,
              zoomGesturesEnabled: true,
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              mapObjects: mapObjects,
              onMapTap: (Point point) {
                marker(
                    latitude: point.latitude.toDouble(),
                    longitude: point.longitude.toDouble());
                address(point.latitude.toDouble(), point.longitude.toDouble());
                if (mounted) {
                  setState(() {});
                }
              },
              onMapCreated: (YandexMapController yandexMapController) async {
                controller = yandexMapController;
                await controller.getCameraPosition().then(
                  (value) async {
                    await controller.moveCamera(CameraUpdate.newCameraPosition(
                        const CameraPosition(
                            target: Point(
                                latitude: 40.3954342, longitude: 71.779473),
                            zoom: 15.0)));
                  },
                );
              },
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 152.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(cRadius22.r),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20.r,
                          color: cElevationColor.withOpacity(0.1),
                          spreadRadius: 20)
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // const SizedBox(width: 0,),

                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: SvgPicture.asset(
                                  'assets/icons/arrow-left.svg'),
                            ),
                          ),
                          Text(
                            'Manzilni tanlang',
                            style: textStyle16,
                          ),
                          IconButton(onPressed: () {}, icon: Container())
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: 214.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(cRadius22.r),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color: cElevationColor.withOpacity(0.1),
                          spreadRadius: 20)
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 5.h),
                        height: 65,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: cGrayColorBackground,
                          borderRadius: BorderRadius.circular(cRadius15.r),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 25.w,
                            ),
                            SvgPicture.asset(
                              "assets/icons/location.svg",
                              color: cGrayColor,
                              height: 24.h,
                              width: 24.w,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Expanded(
                              child: AutoSizeText(
                                city,
                                style: textStyle16,
                                // minFontSize: 14.sp,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (city != 'Manzilni tanlang') {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                                result: city);
                          }else{
                            Fluttertoast.showToast(msg: 'Manzilni tanlang');
                          }
                        },
                        child: const Text('Manzilingizni tasdiqlang'),
                        style: buttonStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: Container(
          padding: const EdgeInsets.only(
            bottom: 230.0,
          ),
          child: FloatingActionButton(
            child: SvgPicture.asset('assets/icons/location2.svg'),
            backgroundColor: Colors.white,
            onPressed: () async {
              await controller.moveCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: Point(
                          latitude: currentPosition!.latitude!.toDouble(),
                          longitude: currentPosition!.longitude!.toDouble()),
                      zoom: 16.0)));
              address(currentPosition!.latitude!.toDouble(),
                  currentPosition!.longitude!.toDouble());
              marker(
                  latitude: currentPosition!.latitude!.toDouble(),
                  longitude: currentPosition!.longitude!.toDouble());
            },
          ),
        ),
      ),
    );
  }

  marker({latitude, longitude}) {
    if (mapObjects.isEmpty) {
      if (mapObjects.any((element) => element.mapId == placemarkId)) {
        return;
      }

      final placemark = Placemark(
        mapId: placemarkId,
        point: Point(latitude: latitude, longitude: longitude),
        onTap: (Placemark self, Point point) {},
        direction: 0,
        opacity: 1,
        isDraggable: true,
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            scale: 2.4,
            image: BitmapDescriptor.fromAssetImage('assets/images/Vector.png'),
            rotationType: RotationType.noRotation)),
      );
      if (mounted) {
        setState(() {
          mapObjects.add(placemark);
        });
      }
    } else if (mapObjects.isNotEmpty) {
      if (!mapObjects.any((element) => element.mapId == placemarkId)) {
        return;
      }

      final placemarkUpdate =
          mapObjects.firstWhere((el) => el.mapId == placemarkId) as Placemark;
      if (mounted) {
        setState(() {
          mapObjects[mapObjects.indexOf(placemarkUpdate)] =
              placemarkUpdate.copyWith(
            point: Point(latitude: latitude, longitude: longitude),
          );
        });
      }
    }
  }

  Future getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    currentPosition = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      if (mounted) {
        setState(() {
          currentPosition = currentLocation;
        });
      }
    });
  }
}
