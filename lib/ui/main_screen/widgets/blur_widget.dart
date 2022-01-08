import 'package:flutter/material.dart';

import '/extensions/theme_x.dart';

class BlurWidget extends StatelessWidget {
  final bool isBig;
  const BlurWidget({Key? key, required this.isBig}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isBig ? 1 : 0,
      duration: Duration(milliseconds: 400),
      child: Container(
        color: Colors.white,
        width: context.width,
        height: context.height,
      ),
    );
  }
}
