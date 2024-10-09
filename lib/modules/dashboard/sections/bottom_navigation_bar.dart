import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trackizer/assets/icons.dart';
import 'package:trackizer/modules/dashboard/controller.dart';
import 'package:trackizer/styles/colors.dart';
import 'package:trackizer/styles/theme.dart';

class DashboardBottomNavBar extends StatelessWidget {
  const DashboardBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      margin: EdgeInsets.only(
        left: AppTheme.defaultPadding,
        right: AppTheme.defaultPadding,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 55.h),
            painter: BottomNavBarPainter(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const NavItem(icon: DashboardIcons.home, index: 0),
                const NavItem(icon: DashboardIcons.budgets, index: 1),
                SizedBox(width: 66.w),
                const NavItem(icon: DashboardIcons.calendar, index: 2),
                const NavItem(icon: DashboardIcons.creditCards, index: 3),
              ],
            ),
          ),
          Positioned(
            top: -11,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 48.h,
                height: 48.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accentP100,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentP100.withOpacity(.5),
                      blurRadius: 25,
                      spreadRadius: 0,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.icon,
    required this.index,
  });

  final String icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isCurrent = context.select<DashboardController, bool>(
      (controller) => controller.pageIndex == index,
    );

    return GestureDetector(
      onTap: () {
        context.read<DashboardController>().setPageIndex(index);
      },
      child: Container(
        padding: const EdgeInsets.all(12).r,
        child: SvgPicture.asset(
          icon,
          color: isCurrent ? Colors.white : AppColors.grey30,
          height: 16.h,
          width: 16.h,
        ),
      ),
    );
  }
}

class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4E4E61).withOpacity(0.75)
      ..style = PaintingStyle.fill;

    const cornerRadius = 16.0;

    final path = Path()
      ..moveTo(0, cornerRadius)
      ..quadraticBezierTo(0, 0, cornerRadius, 0)
      ..lineTo(size.width * 0.35 - cornerRadius, 0)
      ..quadraticBezierTo(size.width * 0.35, 0, size.width * 0.35, 0)
      ..quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20)
      ..arcToPoint(
        Offset(size.width * 0.60, 20),
        radius: const Radius.circular(30),
        clockwise: false,
      )
      ..quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0)
      ..quadraticBezierTo(size.width * 0.65, 0, size.width * 0.65 + cornerRadius, 0)
      ..lineTo(size.width - cornerRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, cornerRadius)
      ..lineTo(size.width, size.height - cornerRadius)
      ..quadraticBezierTo(size.width, size.height, size.width - cornerRadius, size.height)
      ..lineTo(cornerRadius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - cornerRadius)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
