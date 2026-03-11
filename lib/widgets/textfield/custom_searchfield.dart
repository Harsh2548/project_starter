import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/styles.dart';

class CustomSearchField extends StatelessWidget {
  final Function(String)? onChanged;
  final String hintText;

  const CustomSearchField({
    super.key,
    this.onChanged,
    this.hintText = "Search",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primaryColor)
      ),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          // color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(9.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 12.w),
            Icon(
              CupertinoIcons.search,
              color: AppColors.primaryColor,
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: TextField(
                onChanged: onChanged,
                style: Styles.lightBody.copyWith(color: AppColors.primaryColor),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: Styles.lightBody.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
