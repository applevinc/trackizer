import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/assets/icons.dart';
import 'package:trackizer/assets/images.dart';
import 'package:trackizer/modules/authentication/sign_up/screen.dart';
import 'package:trackizer/styles/colors.dart';
import 'package:trackizer/styles/theme.dart';
import 'package:trackizer/utils/navigator.dart';
import 'package:trackizer/widgets/app_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppTheme.defaultPadding),
          child: Column(
            children: [
              Image.asset(
                AppImages.appLogoWithName,
                height: 24.h,
                width: 146.w,
              ),
              const Spacer(),
              GlowAppButton(
                icon: AppIcons.apple,
                label: 'Sign up with Apple',
                backgroundColor: Colors.black,
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              GlowAppButton(
                icon: AppIcons.google,
                label: 'Sign up with Google',
                labelColor: AppColors.grey80,
                backgroundColor: Colors.white,
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              GlowAppButton(
                icon: AppIcons.facebook,
                label: 'Sign up with Google',
                backgroundColor: const Color(0xff1771E6),
                onPressed: () {},
              ),
              SizedBox(height: 40.h),
              Text(
                'or',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              AppButton(
                label: 'Sign up with E-mail',
                onPressed: () {
                  context.push(const SignUpScreen());
                },
              ),
              SizedBox(height: 24.h),
              Text(
                'By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.grey50,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
