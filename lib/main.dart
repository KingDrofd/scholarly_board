import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scholarly_board/components/provider/page_provider.dart';
import 'package:scholarly_board/pages/accountPage/account_page.dart';
import 'package:scholarly_board/pages/chartPages/bar_chart_page.dart';
import 'package:scholarly_board/pages/chartPages/line_chart_page.dart';
import 'package:scholarly_board/pages/chartPages/pie_chart_page.dart';
import 'package:scholarly_board/pages/chartPages/radar_chart_page.dart';
import 'package:scholarly_board/pages/chartPages/scatter_chart_page.dart';
import 'package:scholarly_board/pages/chartPages/table_chart_page.dart';
import 'package:scholarly_board/pages/dashboard/dashboard_page.dart';
import 'package:scholarly_board/pages/homePage/home_page.dart';
import 'package:scholarly_board/pages/settingsPage/settings_page.dart';

import 'components/SideBar/side_bar.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => PageProvider(), child: const MyApp()));
  doWhenWindowReady(() {
    const initialSize = Size(1280, 780);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "Scholarly Board";
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            const SideBar(),
            ShowcasePage(),
          ],
        ),
      ),
    );
  }
}

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          WindowTitleBarBox(
            child: Row(
              children: [
                Expanded(child: MoveWindow()),
                Row(
                  children: [
                    MinimizeWindowButton(),
                    MaximizeWindowButton(),
                    CloseWindowButton()
                  ],
                )
              ],
            ),
          ),
          Consumer<PageProvider>(
            builder: (context, pageProvider, _) {
              switch (pageProvider.currentPage) {
                case Pages.HomePage:
                  return HomePage();
                case Pages.DashboardPage:
                  return DashboardPage();
                case Pages.SettingsPage:
                  return SettingsPage();
                case Pages.LineChartPage:
                  return LineChartPage();
                case Pages.BarChartPage:
                  return BarChartPage();
                case Pages.PieChartPage:
                  return PieChartPage();
                case Pages.ScatterChartPage:
                  return ScatterChartPage();
                case Pages.RadarChartPage:
                  return RadarChartPage();
                case Pages.TableChartPage:
                  return TableChartPage();
                case Pages.AccountPage:
                  return AccountPage();
              }
            },
          ),
        ],
      ),
    );
  }
}
