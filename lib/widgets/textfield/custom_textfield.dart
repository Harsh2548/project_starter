import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String placeholder;
  final bool isEditing;
  final Widget? suffixIcon;
  final TextCapitalization textCapital;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final int? maxLine;
  final double? height;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.isEditing = true,
    required this.placeholder,
    this.suffixIcon,
    this.textCapital = TextCapitalization.sentences,
    this.inputFormatter,
    this.maxLength,
    this.maxLine,
    this.height,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.textColor, width: 0.25),
    );

    final blueBorder = defaultBorder.copyWith(
      borderSide:
      BorderSide(color: AppColors.activeBorderColor, width: 1),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (placeholder.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: 4.h,left: 6.w),
            child: Text(
              placeholder,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, _) {
            bool hasText = value.text.isNotEmpty;
            return Container(
              height: height ?? 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 0.65,
                  color: hasText
                      ? AppColors.activeBorderColor
                      : AppColors.inactiveBorderColor.withValues(alpha: 0.05),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25), // subtle shadow
                    blurRadius: 2, // softness
                    offset: const Offset(0, 0), // x, y offset
                  ),
                ],
              ),
              child: TextField(
                maxLines: maxLine,
                controller: controller,
                enabled: isEditing,
                inputFormatters: inputFormatter,
                textCapitalization: textCapital,
                maxLength: maxLength,
                keyboardType: keyboardType,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textColor,
                ),
                onChanged: onChanged,
                obscureText: obscureText,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.otherTextColor,
                    fontWeight: FontWeight.w300,
                  ),
                  filled: true,
                  fillColor: AppColors.white,
                  border: defaultBorder,
                  enabledBorder: hasText ? blueBorder : defaultBorder,
                  focusedBorder: blueBorder,
                  disabledBorder: defaultBorder,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 6.h,
                  ),
                  suffixIcon: suffixIcon,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
