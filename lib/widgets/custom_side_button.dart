import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SideBarButton extends StatefulWidget {
  final IconData icon;
  final Function()? onTap;
  final bool isFocused;
  final int index;

  const SideBarButton({
    required this.index,
    this.icon = Icons.home_rounded,
    this.onTap,
    this.isFocused = false,
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
          _isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          widget.onTap?.call();
        },
        child: Focus(
          onFocusChange: (isFocused) {
            setState(() {
              _isHover = isFocused;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _isHover || widget.isFocused
                  ? Colors.deepPurpleAccent
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: (_isHover || widget.isFocused)
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
              color: _isHover || widget.isFocused ? Colors.white : Colors.black,
            ),
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
