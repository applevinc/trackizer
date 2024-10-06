import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  Future<T?> push<T extends Object?>(Widget nextScreen) async {
    return await Navigator.push<T>(this, MaterialPageRoute(builder: (_) => nextScreen));
  }

  Future<T?> go<T extends Object?>(Widget nextScreen) async {
    return await Navigator.of(this).pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (context) => nextScreen),
      (Route<dynamic> route) => false,
    );
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(Widget nextScreen) async {
    return await Navigator.of(this).pushReplacement<T, TO>(
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  void pop<T extends Object?>([T? result]) {
    return Navigator.of(this).pop<T>(result);
  }
}
