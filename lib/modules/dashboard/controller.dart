import 'package:flutter/material.dart';

class DashboardController extends ChangeNotifier {
  DashboardController() {
    pages = [
      Container(color: Colors.red),
      Container(color: Colors.yellow),
      Container(color: Colors.orange),
      Container(color: Colors.green),
    ];
  }

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  late final List<Widget> pages;

  Widget get currentPage => pages[pageIndex];

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
