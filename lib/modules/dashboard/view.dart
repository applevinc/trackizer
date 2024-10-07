import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trackizer/modules/dashboard/controller.dart';
import 'package:trackizer/modules/dashboard/sections/bottom_navigation_bar.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardController(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DashboardController>();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: controller.currentPage),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 120.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0000001),
                    Colors.black, // Fully black at the bottom
                  ],
                  stops: const [0.0, 0.6],
                ),
              ),
              child: const SizedBox.shrink(),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: DashboardBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
