import 'package:flutter/material.dart';
import 'package:yoga_app_ui/constraints.dart';

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final bool isactive;
  const BottomNavItem({Key? key, required this.icon, this.isactive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
              color: isactive == true ? kActiveBackgroundcolor : kTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
