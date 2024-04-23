import 'package:flutter/material.dart';

enum Pages {
  HomePage,
  DashboardPage,
  LineChartPage,
  BarChartPage,
  PieChartPage,
  ScatterChartPage,
  RadarChartPage,
  TableChartPage,
  AccountPage,
  SettingsPage
}

class PageProvider extends ChangeNotifier {
  Pages _currentPage = Pages.HomePage;

  Pages get currentPage => _currentPage;

  void setCurrentPage(Pages page) {
    _currentPage = page;
    notifyListeners();
  }
}
