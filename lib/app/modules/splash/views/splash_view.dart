import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/values/images.dart';
import '../../../theme/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlueBackground,
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset(
            Images.logoName,
            width: Get.width / 1.5,
            // color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class PrimaryGradientBase extends StatelessWidget {
  const PrimaryGradientBase({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.primaryGradient,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: child,
    );
  }
}