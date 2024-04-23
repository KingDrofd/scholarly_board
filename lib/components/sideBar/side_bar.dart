import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scholarly_board/components/provider/page_provider.dart';
import 'package:scholarly_board/widgets/custom_side_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    super.key,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 15),
      width: 64,
      height: double.maxFinite,
      decoration: const BoxDecoration(color: Colors.white),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SideBarButton(
              icon: Icons.home_outlined,
              onTap: () {
                Provider.of<PageProvider>(context, listen: false)
                    .setCurrentPage(Pages.HomePage);
                setState(() {});
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
                  icon: Icons.dashboard_outlined,
                  onTap: () {
                    Provider.of<PageProvider>(context, listen: false)
                        .setCurrentPage(Pages.DashboardPage);
                    setState(() {});
                  },
                ),
                const Gap(20),
                SideBarButton(
                  icon: Icons.bar_chart_outlined,
                  onTap: () {
                    Provider.of<PageProvider>(context, listen: false)
                        .setCurrentPage(Pages.BarChartPage);
                    setState(() {});
                  },
                ),
                const Gap(20),
                SideBarButton(
                  icon: Icons.pie_chart_outline_rounded,
                  onTap: () {
                    Provider.of<PageProvider>(context, listen: false)
                        .setCurrentPage(Pages.PieChartPage);
                    setState(() {});
                  },
                ),
                const Gap(20),
                SideBarButton(
                  icon: Icons.area_chart_outlined,
                  onTap: () {
                    Provider.of<PageProvider>(context, listen: false)
                        .setCurrentPage(Pages.ScatterChartPage);
                    setState(() {});
                  },
                ),
                const Gap(20),
                SideBarButton(
                  icon: Icons.show_chart_rounded,
                  onTap: () {
                    Provider.of<PageProvider>(context, listen: false)
                        .setCurrentPage(Pages.LineChartPage);
                    setState(() {});
                  },
                ),
                const Gap(20),
                SideBarButton(
                  icon: Icons.radar_outlined,
                  onTap: () {
                    Provider.of<PageProvider>(context, listen: false)
                        .setCurrentPage(Pages.RadarChartPage);
                    setState(() {});
                  },
                ),
                const Gap(20),
                SideBarButton(
                  icon: Icons.table_chart_outlined,
                  onTap: () {
                    Provider.of<PageProvider>(context, listen: false)
                        .setCurrentPage(Pages.TableChartPage);
                    setState(() {});
                  },
                ),
                const Gap(20),
                SideBarButton(
                  icon: Icons.add_chart_rounded,
                ),
              ],
            ),
            const Gap(40),
            Container(
              width: 50,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Tools",
                    style: GoogleFonts.rubik(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const Gap(20),
                  SideBarButton(
                    icon: Icons.account_circle_outlined,
                    onTap: () {
                      Provider.of<PageProvider>(context, listen: false)
                          .setCurrentPage(Pages.AccountPage);
                      setState(() {});
                    },
                  ),
                  const Gap(10),
                  SideBarButton(
                    icon: Icons.settings_outlined,
                    onTap: () {
                      Provider.of<PageProvider>(context, listen: false)
                          .setCurrentPage(Pages.SettingsPage);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
