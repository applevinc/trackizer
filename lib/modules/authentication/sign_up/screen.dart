import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trackizer/assets/images.dart';
import 'package:trackizer/modules/authentication/sign_in/screen.dart';
import 'package:trackizer/modules/authentication/sign_up/controller.dart';
import 'package:trackizer/modules/authentication/sign_up/sections/password_strength_indicator.dart';
import 'package:trackizer/styles/colors.dart';
import 'package:trackizer/styles/theme.dart';
import 'package:trackizer/utils/navigator.dart';
import 'package:trackizer/widgets/app_button.dart';
import 'package:trackizer/widgets/text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpController(),
      child: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({super.key});

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  void signUp() async {}

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SignUpController>();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppTheme.defaultPadding),
          child: SizedBox(
            height: 0.9.sh,
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppImages.appLogoWithName,
                      height: 24.h,
                      width: 146.w,
                    ),
                  ),
                  const Spacer(),
                  CustomTextField(
                    controller: controller.emailController,
                    title: 'E-mail address',
                    validator: controller.validateEmail,
                  ),
                  SizedBox(height: 20.h),
                  PasswordTextField(
                    controller: controller.passwordController,
                    title: 'Password',
                    onChanged: controller.onPasswordChanged,
                  ),
                  SizedBox(height: 24.h),
                  const SignUpPasswordStrengthIndicator(),
                  SizedBox(height: 16.h),
                  Text(
                    'Use 8 or more characters with a mix of letters, numbers & symbols.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.grey50,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  GlowAppButton(
                    label: 'Get started, it’s free!',
                    onPressed: signUp,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Do you have already an account?',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.grey50,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  AppButton(
                    label: 'Sign In',
                    onPressed: () {
                      context.go(const SignInScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
