import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_bindings.dart';
import 'data/values/constants.dart';
import 'routes/app_pages.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      navigatorKey: GlobalKeys.navigationKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
    );
  }
}