import 'package:cti/core/constants/colors.dart';
import 'package:cti/core/local/storage_services.dart';
import 'package:cti/core/network/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/login/view/login_screen.dart';

DioHelper? dioHelper;
StorageService? storageService;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  storageService = await StorageService.init();
  dioHelper = DioHelper(dio: Dio());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CTI',
      debugShowCheckedModeBanner: false,
      locale: const Locale("ar"),
      supportedLocales: const [Locale("ar")],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primary,
            actionsIconTheme: IconThemeData(color: Colors.white)),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.offWhite,
        tabBarTheme: const TabBarTheme(
          labelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          indicatorColor: Colors.black,
        ),
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const LoginScreen(),
    );
  }
}
