import 'package:flutter/material.dart';

import '/extensions/theme_x.dart';

class TopbarWidget extends StatelessWidget {
  final double barHeight;
  final bool isBig;
  const TopbarWidget({Key? key, required this.barHeight, required this.isBig})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      child: Container(
        width: context.width,
        height: barHeight / 2.2,
        decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: isBig
                    ? AssetImage("assets/whitelogo.png")
                    : AssetImage("assets/blacklogo.png"))),
      ),
    );
  }
}
