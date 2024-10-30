import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final double size;
  final VoidCallback onPressed;
  final IconData icon;
  final Color secondcolor;
  final List<Color> gradientColors;

  CircleIconButton(
      {required this.size,
      required this.icon,
      required this.onPressed,
      required this.secondcolor,
      required this.gradientColors,
      required Color firstcolor, required onChanged, required TextInputType keyboardType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: this.onPressed,
        child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment(0.0, 0.0),
              children: <Widget>[
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: gradientColors,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Icon(
                  icon,
                  size: size * 0.6,
                  color: secondcolor,
                )
              ],
            )));
  }
}
