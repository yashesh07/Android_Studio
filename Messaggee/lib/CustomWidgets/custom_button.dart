import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color colour;
  final Color borderColour;
  final Color textColour;
  final String text;
  final double height;
  final double width;
  final double elevation;
  final double letterSpacing;
  final double textFontSize;
  final FontWeight fontWeight;
  final Function() onPress;
  final double edgeRadius;

  CustomButton(
      {this.colour = Colors.white,
      required this.text,
      required this.onPress,
      this.height = 40.0,
      this.width = 275.0,
      this.textColour = Colors.black,
      this.textFontSize = 20.0,
      this.edgeRadius = 50.0,
        this.letterSpacing = 0.0,
        this.fontWeight = FontWeight.w300,
        this.borderColour = Colors.transparent,
      this.elevation = 0.0,});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      color: colour,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColour, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(edgeRadius)),
      child: MaterialButton(
        onPressed: onPress,
        minWidth: width,
        height: height,
        child: Text(
          text,
          style: TextStyle(
              color: textColour,
              fontSize: textFontSize,
              fontFamily: 'Dongle',
              letterSpacing: letterSpacing,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}
