import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trackizer/styles/theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.icon,
    this.labelColor,
  });

  const AppButton.icon({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.backgroundColor,
    this.labelColor,
  });

  final String label;
  final Function() onPressed;
  final Color? backgroundColor;
  final String? icon;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.15),
            Colors.white.withOpacity(0),
          ],
          stops: const [0, 1],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white.withOpacity(.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.buttonBorderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              SvgPicture.asset(
                icon!,
                width: 16.h,
                height: 16.h,
              ),
              SizedBox(width: 8.w),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: labelColor ?? Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GlowAppButton extends StatelessWidget {
  const GlowAppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.icon,
    this.labelColor,
  });

  final String label;
  final Function() onPressed;
  final Color? backgroundColor;
  final String? icon;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = this.backgroundColor ?? const Color(0xffFF7966);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.buttonBorderRadius),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(.5),
            blurRadius: 25,
            spreadRadius: 0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: icon == null
          ? AppButton(
              label: label,
              onPressed: onPressed,
              backgroundColor: backgroundColor,
              labelColor: labelColor,
            )
          : AppButton.icon(
              label: label,
              onPressed: onPressed,
              icon: icon!,
              backgroundColor: backgroundColor,
              labelColor: labelColor,
            ),
    );
  }
}
