import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/styles/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    this.validator,
    this.obscure = false,
    this.suffixIcon,
    this.onChanged,
  });

  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validator;
  final bool obscure;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.grey50,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 4.h),
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          obscureText: obscure,
          onChanged: onChanged,
          style: TextStyle(
            fontSize: 14.sp,
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.title,
    this.validator,
    this.onChanged,
  });

  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _hidePassword = true;

  void _onToggleVisibility() {
    _hidePassword = !_hidePassword;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      title: widget.title,
      obscure: _hidePassword,
      controller: widget.controller,
      onChanged: widget.onChanged,
      suffixIcon: IconButton(
        onPressed: _onToggleVisibility,
        icon: Icon(
          _hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          size: 16.sp,
          color: AppColors.grey50,
        ),
      ),
      validator: widget.validator,
    );
  }
}
