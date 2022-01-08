import 'dart:math' as math;
import 'package:flutter/material.dart';

import '/extensions/theme_x.dart';

class MenuListWidget extends StatefulWidget {
  final bool isBig;
  const MenuListWidget({Key? key, required this.isBig}) : super(key: key);

  @override
  _MenuListWidgetState createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends State<MenuListWidget> {
  bool complete = false;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      onEnd: () {
        complete = true;
        setState(() {});
      },
      tween: widget.isBig ? Tween(begin: 1, end: 0) : Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutBack,
      builder: (context, value, child) {
        complete = false;
        return Transform.rotate(
          alignment: Alignment.bottomCenter,
          angle: math.pi * value,
          child: child,
        );
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: (widget.isBig == false) ? 0 : 1,
        child: Container(
          width: context.width,
          height: context.height / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '๏ Main ๏',
                style: context.headline1
                    .copyWith(color: Colors.white.withOpacity(.8)),
              ),
              Text(
                'The Colleciton',
                style: context.headline1
                    .copyWith(color: Colors.white.withOpacity(.6)),
              ),
              Text(
                'Lookbook',
                style: context.headline1
                    .copyWith(color: Colors.white.withOpacity(.6)),
              ),
              Text(
                'Blog',
                style: context.headline1
                    .copyWith(color: Colors.white.withOpacity(.6)),
              ),
              Text(
                'Support',
                style: context.headline1
                    .copyWith(color: Colors.white.withOpacity(.6)),
              ),
              Text(
                'Contact',
                style: context.headline1
                    .copyWith(color: Colors.white.withOpacity(.6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
