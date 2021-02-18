import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width, size.height * 2, size.width * 2, size.height / 2 - 30);
    path.lineTo(0, size.height - 80);
    // path.lineTo(0, size.height);
    // path.quadraticBezierTo(size.width, size.height * 2, 0, 0);
    // path.lineTo(size.height, size.width / 2);
    // path.lineTo(size.width, 0);
    // path.quadraticBezierTo(size.width, size.height / 3, size.width, size.height / 5);
    // path.lineTo(0, size.width / 3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
