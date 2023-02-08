import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'di/dependency_injection.dart' as di;
import 'features/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/korzina_screen/data/korzina_hive/korzina_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<KorzinaCard>(KorzinaCardAdapter());
  Hive.openBox<KorzinaCard>('korzina_box');
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  di.init();
  runZonedGuarded(() {
    runApp(const AppProvider());
  }, (error, stacktrace) {
    log('runZonedGuarded Errors: $error');
  });
}
