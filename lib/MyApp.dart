import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/bindings/general_binding.dart';
import 'package:shoping_app/routes/app_routes.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/theme/theme.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: SColors.primaryColor, body: Center(child: CircularProgressIndicator(color: SColors.white)))
    );
  }

}