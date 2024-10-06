import 'package:flutter/material.dart';
import 'package:trackizer/modules/authentication/mixins/validator.dart';

class SignUpController extends ChangeNotifier with Validator {
  SignUpController() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  final formKey = GlobalKey<FormState>();

  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  List<bool> _strengthIndicators = List.filled(4, false);

  List<bool> get strengthIndicators => _strengthIndicators;

  void onPasswordChanged(String newPassword) {
    _updateStrengthIndicators(newPassword);
    notifyListeners();
  }

  void _updateStrengthIndicators(String newPassword) {
    bool hasLetters = newPassword.contains(RegExp(r'[a-zA-Z]'));
    bool hasNumbers = newPassword.contains(RegExp(r'[0-9]'));
    bool hasSymbols = newPassword.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = newPassword.length >= 8;

    bool isStrongPassword = hasMinLength && hasLetters && hasNumbers && hasSymbols;
    bool isModeratePassword = hasMinLength &&
        ((hasLetters && hasNumbers) || (hasLetters && hasSymbols) || (hasNumbers && hasSymbols));
    bool isWeakPassword = hasMinLength && (hasLetters || hasNumbers || hasSymbols);
    bool isVeryWeakPassword = newPassword.isNotEmpty;

    if (isStrongPassword) {
      _strengthIndicators = [true, true, true, true];
      return;
    }

    if (isModeratePassword) {
      _strengthIndicators = [true, true, true, false];
      return;
    }

    if (isWeakPassword) {
      _strengthIndicators = [true, true, false, false];
      return;
    }

    if (isVeryWeakPassword) {
      _strengthIndicators = [true, false, false, false];
      return;
    }

    _strengthIndicators = [false, false, false, false];
  }

  Future<void> signUp() async {
    if (formKey.currentState?.validate() ?? false) {
      throw Exception('Sign up not implemented');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
