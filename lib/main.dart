import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokemony/core/theme/app_colors.dart';

import 'core/theme/app_theme.dart';
import 'features/splash/splash_page.dart';

void main() {
  runZonedGuarded(
    () async {
      //init firebase and storage
      await GetStorage.init();
      await Firebase.initializeApp();
      SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp],
      ).then((_) {
        runApp(const ProviderScope(child: Application()));
      });
    },
    (error, stack) {
      debugPrint('Error: ${error.toString()}\nStackTrace: ${stack.toString()}');
    },
  );
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: kMainColor,
      debugShowCheckedModeBanner: false,
      title: 'Pokemony',
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
