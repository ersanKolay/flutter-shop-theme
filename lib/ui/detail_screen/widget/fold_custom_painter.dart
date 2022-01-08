import 'package:flutter/material.dart';
import '/theme/theme.dart';
import '/extensions/theme_x.dart';

class FoldCustomPainter extends CustomPainter {
  final double value;

  FoldCustomPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    Path mainBGPath = Path();
    mainBGPath.addRect(Rect.fromLTWH(0.0, 0.0, size.width, 150 * value));
    paint.color = ShopTheme.xBrown;

    canvas.drawPath(mainBGPath, paint);

    Path shadow = Path();
    shadow.addRect(Rect.fromLTWH(0, (size.height - 20.0.newHeight(value)) / 2,
        size.width, 20.0.newHeight(value)));
    canvas.drawShadow(shadow, Colors.black54, 3, true);

    Path trianglePath = Path();
    trianglePath.moveTo(0, 0);
    trianglePath.lineTo((50 - 50 * value), size.height / 2);
    trianglePath.lineTo(0, size.height);
    trianglePath.close();
    paint.color = Colors.white;
    canvas.drawPath(trianglePath, paint);

    Path trianglePath2 = Path();
    trianglePath2.moveTo(size.width, 0);
    trianglePath2.lineTo(size.width - (50 - 50 * value), (size.height / 2));
    trianglePath2.lineTo(size.width, size.height);
    trianglePath2.close();
    paint.color = Colors.white;
    canvas.drawPath(trianglePath2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
