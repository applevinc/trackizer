import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackizer/styles/colors.dart';

abstract class AppTheme {
  static double buttonBorderRadius = 1000.0.r;

  static double defaultPadding = 24.w;

  static InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: const BorderSide(color: AppColors.grey70),
  );

  static ThemeData get darkTheme {
    return ThemeData(
      splashFactory: NoSplash.splashFactory,
      scaffoldBackgroundColor: AppColors.grey80,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary100,
        secondary: AppColors.accentP100,
      ),
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          minimumSize: Size(double.infinity, 48.h),
          fixedSize: Size(double.infinity, 48.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonBorderRadius),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: AppColors.grey40),
        ),
        errorBorder: border.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
