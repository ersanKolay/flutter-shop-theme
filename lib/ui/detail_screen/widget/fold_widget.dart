import 'package:flutter/material.dart';

import '/extensions/theme_x.dart';
import '/theme/theme.dart';
import '/ui/detail_screen/widget/fold_custom_painter.dart';

class FoldWidget extends StatefulWidget {
  final String title;
  final String content;
  const FoldWidget({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  _FoldWidgetState createState() => _FoldWidgetState();
}

class _FoldWidgetState extends State<FoldWidget> with TickerProviderStateMixin {
  bool isOpenDraw = false;
  late AnimationController _animationController;
  late Animation<double> _myAnimation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _myAnimation =
        CurvedAnimation(curve: Curves.linear, parent: _animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: Colors.white,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (isOpenDraw) {
                _animationController.reverse();
                isOpenDraw = !isOpenDraw;
                setState(() {});
              } else {
                _animationController.forward();
                isOpenDraw = !isOpenDraw;
                setState(() {});
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _myAnimation,
                    color: ShopTheme.xBrown,
                  ),
                  Text('  ' + widget.title),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
              animation: _animationController,
              builder: (context, i) {
                return CustomPaint(
                  painter: FoldCustomPainter(_animationController.value),
                  child: Container(
                    height: 150.0 * _animationController.value,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedOpacity(
                        duration: kThemeAnimationDuration,
                        opacity: isOpenDraw && _animationController.isCompleted
                            ? 1
                            : 0,
                        child: Text(
                          widget.content,
                          maxLines: 7,
                          style: context.bodyText1.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w100),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
