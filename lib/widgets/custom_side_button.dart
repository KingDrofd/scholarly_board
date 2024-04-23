import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SideBarButton extends StatefulWidget {
  const SideBarButton({
    super.key,
  });

  @override
  State<SideBarButton> createState() => _SideBarButtonState();
}

class _SideBarButtonState extends State<SideBarButton> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {});
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            print("Clicked!");
          });
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.auto_graph_rounded),
        ),
      ),
    );
  }
}

class SideButtonGhost extends StatelessWidget {
  const SideButtonGhost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
