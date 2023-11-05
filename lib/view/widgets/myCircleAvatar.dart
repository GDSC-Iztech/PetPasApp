import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  final double border;
  final double radius;
  final ImageProvider backgroundImage;
  final Color backgroundColor;
  const MyCircleAvatar(
      {super.key,
      required this.border,
      required this.radius,
      required this.backgroundImage,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      maxRadius: radius + border,
      child: CircleAvatar(
        maxRadius: radius,
        backgroundImage: backgroundImage,
      ),
    );
  }
}
