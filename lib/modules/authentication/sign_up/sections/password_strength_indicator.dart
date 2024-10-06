import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trackizer/modules/authentication/sign_up/controller.dart';
import 'package:trackizer/styles/colors.dart';

class SignUpPasswordStrengthIndicator extends StatelessWidget {
  const SignUpPasswordStrengthIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final strengthIndicators = context.watch<SignUpController>().strengthIndicators;

    return Row(
      children: List.generate(
        4,
        (index) => Expanded(
          child: Container(
            height: 5.h,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: strengthIndicators[index] ? _getColor(index) : AppColors.grey70,
              borderRadius: BorderRadius.circular(9.r),
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
