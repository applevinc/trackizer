import 'package:flutter/material.dart';
import 'package:trackizer/modules/authentication/mixins/validator.dart';

class SignInController extends ChangeNotifier with Validator {
  SignInController() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  final formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    if (formKey.currentState?.validate() ?? false) {}
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
