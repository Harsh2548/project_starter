import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class Styles {
  Styles._privateConstructor();

  static const String _fontFamily = 'Poppins';

  static var tsWhiteRegular18 = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: ScreenUtil().setSp(18),
    fontFamily: _fontFamily,
  );

  static var tsWhiteRegular16 = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: ScreenUtil().setSp(16),
    fontFamily: _fontFamily,
  );

  static var tsWhite16w600 = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w600,
    fontSize: ScreenUtil().setSp(16),
    fontFamily: _fontFamily,
  );

  static var tsWhite12w500 = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    fontSize: ScreenUtil().setSp(12),
    fontFamily: _fontFamily,
  );

  static var tsPrimaryColorRegular18 = TextStyle(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
    fontSize: ScreenUtil().setSp(18),
    fontFamily: _fontFamily,
  );

  static var tsBlackTextColorSemiBold16 = TextStyle(
    color: AppColors.blackText,
    fontWeight: FontWeight.w600,
    fontSize: ScreenUtil().setSp(16),
    fontFamily: _fontFamily,
  );

  static var tsBlackSemiBold14 = TextStyle(
    color: AppColors.blackText,
    fontWeight: FontWeight.w600,
    fontSize: ScreenUtil().setSp(14),
    fontFamily: _fontFamily,
  );

  static var tsBlack16w400= TextStyle(
    color: AppColors.blackText,
    fontWeight: FontWeight.w400,
    fontSize: ScreenUtil().setSp(16),
  );

  static var tsBlackBold28 = TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.w700,
    fontSize: ScreenUtil().setSp(28),
    fontFamily: _fontFamily,
  );

  static var tsLightBlack14w500 = TextStyle(
    color: AppColors.otherTextColor,
    fontWeight: FontWeight.w500,
    fontSize: ScreenUtil().setSp(14),
    fontFamily: _fontFamily,
  );

  static var tsBlack10w300 = TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.w300,
    fontSize: ScreenUtil().setSp(10),
    fontFamily: _fontFamily,
  );

  static var tsBlack10w500 = TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
    fontSize: ScreenUtil().setSp(10),
    fontFamily: _fontFamily,
  );

  static var tsBlack14w300 = TextStyle(
    color: AppColors.blackText,
    fontWeight: FontWeight.w300,
    fontSize: ScreenUtil().setSp(14),
    fontFamily: _fontFamily,
  );

  static var tsBlackRegular16 = TextStyle(
    color: AppColors.blackText,
    fontWeight: FontWeight.w400,
    fontSize: ScreenUtil().setSp(16),
    fontFamily: _fontFamily,
  );

  static var tsBlack12w500 = TextStyle(
    color: AppColors.blackText,
    fontWeight: FontWeight.w500,
    fontSize: ScreenUtil().setSp(12),
    fontFamily: _fontFamily,
  );
}
