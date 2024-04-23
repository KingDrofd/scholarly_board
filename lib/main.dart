import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widgets/custom_side_button.dart';

void main() {
  runApp(const MyApp());
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
        color: Colors.grey[400],
        child: Row(
          children: [
            const SideBar(),
            Expanded(
                child: Column(
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
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: double.maxFinite,
      decoration: const BoxDecoration(color: Colors.grey),
      child: Column(
        children: [
          WindowTitleBarBox(
            child: MoveWindow(),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SideButtonGhost(),
                  const Gap(15),
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const Gap(30),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SideBarButton(),
                      const Gap(20),
                      SideButtonGhost(),
                      const Gap(20),
                      SideButtonGhost(),
                      const Gap(20),
                      SideButtonGhost(),
                      const Gap(20),
                      SideButtonGhost(),
                      const Gap(20),
                      SideButtonGhost(),
                      const Gap(20),
                      SideButtonGhost(),
                      const Gap(20),
                      SideButtonGhost(),
                    ],
                  ),
                  Gap(40),
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const Gap(20),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const Gap(20),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(20)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
