import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SideBarButton extends StatefulWidget {
  final IconData icon;
  final Function()? onTap;
  const SideBarButton({
    this.icon = Icons.home_rounded,
    this.onTap,
    super.key,
  });

  @override
  State<SideBarButton> createState() => _SideBarButtonState();
}

class _SideBarButtonState extends State<SideBarButton> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          _isHover = !_isHover;
        });
      },
      onExit: (event) {
        setState(() {
          _isHover = !_isHover;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _isHover ? Colors.deepPurpleAccent : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: _isHover
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ]
                : [], // No shadow when _isShadowVisible is false
          ),
          child: Icon(
            widget.icon,
            color: _isHover ? Colors.white : Colors.black,
          ),
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
