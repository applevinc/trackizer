import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/assets/images.dart';
import 'package:trackizer/modules/authentication/get_started/screen.dart';
import 'package:trackizer/modules/authentication/sign_in/screen.dart';
import 'package:trackizer/styles/theme.dart';
import 'package:trackizer/utils/navigator.dart';
import 'package:trackizer/widgets/app_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 200.h,
              bottom: 142.h,
              right: 0,
              child: Image.asset(SplashImages.bgBlur),
            ),
            Positioned(
              top: 120.h,
              left: -118.w,
              child: Image.asset(
                SplashImages.bg1,
                width: 288.w,
                height: 219.h,
              ),
            ),
            Positioned(
              top: 400.h,
              right: -110.w,
              child: Image.asset(
                SplashImages.bg2,
                width: 288.w,
                height: 219.h,
              ),
            ),
            Positioned(
              top: 148.h,
              right: 0,
              left: 0,
              child: Image.asset(
                SplashImages.appLogos,
                width: 289.w,
                height: 410.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 40.h,
                  left: AppTheme.defaultPadding,
                  right: AppTheme.defaultPadding,
                  bottom: 30.h,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.appLogoWithName,
                      height: 30.h,
                      width: 178.w,
                    ),
                    const Spacer(),
                    Text(
                      'Congue malesuada in ac justo, a tristique leo massa. Arcu leo leo urna risus.',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    GlowAppButton(
                      label: 'Get started',
                      onPressed: () {
                        context.go(const GetStartedScreen());
                      },
                    ),
                    SizedBox(height: 16.h),
                    AppButton(
                      label: 'I have an account',
                      onPressed: () {
                        context.go(const SignInScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
