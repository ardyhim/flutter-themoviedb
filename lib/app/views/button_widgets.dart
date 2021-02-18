import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final double elevation;
  final String text;
  final Color color;
  final Color textColor;
  final Color splashColor;
  final Color firstColor;
  final Color secondColor;
  final double fontSize;
  final double height;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  CustomButton({
    @required this.onTap,
    @required this.text,
    this.elevation = 5,
    this.splashColor = Colors.blueGrey,
    this.fontSize = 16,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.firstColor = Colors.purpleAccent,
    this.secondColor = Colors.blueAccent,
    this.height = 30.0,
    this.margin = const EdgeInsets.all(8),
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: elevation,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  firstColor,
                  secondColor,
                ],
              ),
            ),
            child: Center(
              child: Text(
                this.text,
                style: TextStyle(
                  color: this.textColor,
                  fontSize: this.fontSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
