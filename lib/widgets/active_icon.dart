import 'package:flutter/material.dart';

class ActiveIcon extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final IconData iconData;
  final double borderRadius;
  final double size;

  const ActiveIcon(
      {Key key,
      this.backgroundColor = Colors.teal,
      this.iconData = Icons.home_filled,
      this.borderRadius = 8,
      this.size = 30,
      this.iconColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadiusDirectional.circular(borderRadius)),
        child: Center(
            child: Icon(
          iconData,
          color: iconColor,
        )));
  }
}
