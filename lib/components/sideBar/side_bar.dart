import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scholarly_board/components/provider/page_provider.dart';
import 'package:scholarly_board/widgets/custom_side_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int _focusedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 15),
      width: 64,
      height: double.maxFinite,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SideBarButton(
                index: 0,
                isFocused: _focusedButtonIndex == 0,
                icon: Icons.home_outlined,
                onTap: () {
                  Provider.of<PageProvider>(context, listen: false)
                      .setCurrentPage(Pages.HomePage);
                  _handleButtonTap(0);
                },
              ),
              const Gap(15),
              Container(
                width: 50,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
              const Gap(30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SideBarButton(
                    index: 1,
                    isFocused: _focusedButtonIndex == 1,
                    icon: Icons.dashboard_outlined,
                    onTap: () {
                      Provider.of<PageProvider>(context, listen: false)
                          .setCurrentPage(Pages.DashboardPage);
                      _handleButtonTap(1);
                    },
                  ),
                  const Gap(20),
                  SideBarButton(
                    index: 2,
                    isFocused: _focusedButtonIndex == 2,
                    icon: Icons.bar_chart_outlined,
                    onTap: () {
                      Provider.of<PageProvider>(context, listen: false)
                          .setCurrentPage(Pages.BarChartPage);
                      _handleButtonTap(2);
                    },
                  ),
                  const Gap(20),
                  SideBarButton(
                    index: 3,
                    isFocused: _focusedButtonIndex == 3,
                    icon: Icons.pie_chart_outline_rounded,
                    onTap: () {
                      Provider.of<PageProvider>(context, listen: false)
                          .setCurrentPage(Pages.PieChartPage);
                      _handleButtonTap(3);
                    },
                  ),
                  const Gap(20),
                  SideBarButton(
                    index: 4,
                    isFocused: _focusedButtonIndex == 4,
                    icon: Icons.area_chart_outlined,
                    onTap: () {
                      Provider.of<PageProvider>(context, listen: false)
                          .setCurrentPage(Pages.ScatterChartPage);
                      _handleButtonTap(4);
                    },
                  ),
                  const Gap(20),
                  SideBarButton(
                    index: 5,
                    isFocused: _focusedButtonIndex == 5,
                    icon: Icons.show_chart_rounded,
                    onTap: () {
                      Provider.of<PageProvider>(context, listen: false)
                          .setCurrentPage(Pages.LineChartPage);
                      _handleButtonTap(5);
                    },
                  ),
                  const Gap(20),
                  SideBarButton(
                    index: 6,
                    isFocused: _focusedButtonIndex == 6,
                    icon: Icons.radar_outlined,
                    onTap: () {
                      Provider.of<PageProvider>(context, listen: false)
                          .setCurrentPage(Pages.RadarChartPage);
                      _handleButtonTap(6);
                    },
                  ),
                  const Gap(20),
                  SideBarButton(
                    index: 7,
                    isFocused: _focusedButtonIndex == 7,
                    icon: Icons.table_chart_outlined,
                    onTap: () {
                      Provider.of<PageProvider>(context, listen: false)
                          .setCurrentPage(Pages.TableChartPage);
                      _handleButtonTap(7);
                    },
                  ),
                  const Gap(20),
                  SideBarButton(
                    index: 8,
                    isFocused: _focusedButtonIndex == 8,
                    icon: Icons.add_chart_rounded,
                  ),
                ],
              ),
            ],
          ),
          const Gap(40),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const Gap(10),
              Text(
                "Tools",
                style: GoogleFonts.rubik(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Gap(20),
              SideBarButton(
                index: 9,
                isFocused: _focusedButtonIndex == 9,
                icon: Icons.account_circle_outlined,
                onTap: () {
                  Provider.of<PageProvider>(context, listen: false)
                      .setCurrentPage(Pages.AccountPage);
                  _handleButtonTap(9);
                },
              ),
              const Gap(10),
              SideBarButton(
                index: 10,
                isFocused: _focusedButtonIndex == 10,
                icon: Icons.settings_outlined,
                onTap: () {
                  Provider.of<PageProvider>(context, listen: false)
                      .setCurrentPage(Pages.SettingsPage);
                  _handleButtonTap(10);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleButtonTap(int index) {
    setState(() {
      _focusedButtonIndex = index;
    });
  }
}
