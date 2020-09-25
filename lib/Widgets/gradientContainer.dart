import 'package:flutter/material.dart';

class GradientContainerRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GradientContainers(
          length: 80,
          initColor: Color.fromRGBO(0, 161, 255, 1),
          finalColor: Color.fromRGBO(0, 189, 141, 1),
        ),
        SizedBox(width: 5),
        GradientContainers(
          length: 80,
          initColor: Color.fromRGBO(0, 189, 141, 1),
          finalColor: Color.fromRGBO(0, 220, 69, 1),
        ),
        SizedBox(width: 5),
        GradientContainers(
          length: 80,
          initColor: Color.fromRGBO(0, 220, 69, 1),
          finalColor: Color.fromRGBO(175, 232, 0, 1),
        ),
      ],
    );
  }
}

class GradientContainers extends StatelessWidget {
  final double length;
  final Color initColor;
  final Color finalColor;

  const GradientContainers({
    @required this.length,
    @required this.initColor,
    @required this.finalColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: length,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            initColor,
            finalColor,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
