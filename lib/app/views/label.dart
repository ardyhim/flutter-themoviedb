import 'package:flutter/material.dart';

class LabelWidgets extends StatelessWidget {
  final Function onTap;
  final String firstText;
  final String secondText;

  LabelWidgets({
    @required this.onTap,
    this.firstText = "Label name",
    this.secondText = "See all",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                firstText,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          if (secondText != null)
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: onTap,
                  child: Text(
                    secondText,
                    style: TextStyle(
                      color: Colors.purple[600],
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
