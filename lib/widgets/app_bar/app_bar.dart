import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../app/data/values/images.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/styles.dart';
import '../../utils/helper/string_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final RxString? userName;
  final bool isDashboard;
  final VoidCallback? onBack;
  final RxInt? totalCount;

  const CustomAppBar({
    super.key,
    required this.title,
    this.userName,
    this.isDashboard = false,
    this.onBack,
    this.totalCount,
  });

  @override
  Size get preferredSize => Size.fromHeight(isDashboard ? 120.h : 80.h);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ));
    return Container(
      decoration:  BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: isDashboard
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    spacing: 4.w,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi,',
                            style: Styles.tsWhite12w500,
                          ),
                          isDashboard
                          ? Obx(() =>
                              Text(
                                StringUtils.extractFirstName(userName?.value ?? ""),
                                style: Styles.tsWhite16w600,
                              ),
                          ) :
                          Text(
                            title,
                            style: Styles.tsWhite16w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(Images.logo,width: 60.w,height: 55.h,)
                ],
              ),
            ],
          )
              : Row(
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.back, color: Colors.white),
                onPressed: onBack ?? () => Navigator.pop(context),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title.toUpperCase(),
                    style: Styles.tsWhite16w600.copyWith(fontWeight: FontWeight.bold,fontSize: 16.sp,letterSpacing: 1),
                  ),
                ),
              ),
              totalCount != null
                  ? Obx(() => Text(
                totalCount.toString(),
                style: Styles.tsWhite16w600.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    letterSpacing: 1),)) : SizedBox.shrink(),
              SizedBox(width: 48.w),
            ],
          ),
        ),
      ),
    );
  }
}


//



enum TitlePosition { left, center, right }

class CustomIOSAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final TitlePosition titlePosition;

  const CustomIOSAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.titlePosition = TitlePosition.center,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration:  BoxDecoration(
          color: AppColors.primaryColor,
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: AppColors.primaryGradient
          // ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.r),
            bottomRight: Radius.circular(25.r),
          ),
        ),
        child: Row(
          children: [
            if (showBackButton)
              GestureDetector(
                onTap: onBackPressed ?? () => Navigator.of(context).pop(),
                child: Icon(Icons.arrow_back_ios, color: AppColors.white),
              ),
            if (!showBackButton) SizedBox(width: 40.w),
            Expanded(
              child: Align(
                alignment: _getAlignment(),
                child: Text(
                  title,
                  style: Styles.tsWhite16w600.copyWith(fontSize: 18.sp ,color: AppColors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            if (showBackButton) SizedBox(width: 40.w),
          ],
        ),
      ),
    );
  }

  Alignment _getAlignment() {
    switch (titlePosition) {
      case TitlePosition.left:
        return Alignment.centerLeft;
      case TitlePosition.center:
        return Alignment.center;
      case TitlePosition.right:
        return Alignment.centerRight;
    }
  }
}