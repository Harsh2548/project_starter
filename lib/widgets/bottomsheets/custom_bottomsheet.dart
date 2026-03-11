import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../app/theme/app_colors.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;

  const CustomBottomSheet({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -44.h,
            child: GestureDetector(
                onTap: () => Get.back(),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18.r,
                  child: Icon(Icons.close_rounded ,color: AppColors.primaryColor,fontWeight: FontWeight.bold,size: 26.w,),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 24.h),
            child: child,
          ),
        ],
      ),
    );
  }

  static Future<T?> show<T>({
    required Widget child,
    bool isDismissible = true,
  }) {
    return Get.bottomSheet<T>(
      CustomBottomSheet(child: child),
      isScrollControlled: true,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
    );
  }
}
