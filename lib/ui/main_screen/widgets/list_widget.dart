import 'package:flutter/material.dart';
import '/extensions/theme_x.dart';
import '/ui/detail_screen/detail_screen.dart';

class ListWidget extends StatefulWidget {
  final ValueChanged<bool>? scrolling;
  const ListWidget({Key? key, this.scrolling}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  num? speed;

  ValueNotifier<num> speedNotifier = ValueNotifier(0.0);
  late double width;
  late double height;
  List<String> price = [
    "340",
    "120",
    "123",
    "234",
    "345",
    "456",
    "543",
    "432",
    "312",
    "456",
    "987",
    "272"
  ];

  int lastMillisecond = DateTime.now().millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    height = context.height;
    width = context.width;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final now = DateTime.now();
        double timeDiff =
            (now.millisecondsSinceEpoch - lastMillisecond).toDouble();
        if (notification is ScrollUpdateNotification) {
          speed = (notification.scrollDelta ?? 0.0 / timeDiff);
          lastMillisecond = DateTime.now().millisecondsSinceEpoch;
          if (speed!.isFinite) speedNotifier.value = speed!;
          widget.scrolling!(true);
        }

        if (notification is ScrollEndNotification) {
          lastMillisecond = DateTime.now().millisecondsSinceEpoch;
          speed = 0.0;
          speedNotifier.value = 0.0;
          widget.scrolling!(false);
        }
        return true;
      },
      child: GridView.builder(
          physics: ScrollPhysics(),
          itemCount: price.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .7,
          ),
          itemBuilder: (context, index) {
            return ValueListenableBuilder<num>(
              valueListenable: speedNotifier,
              builder: (context, value, child) {
                final leftColumn = (-value * 1.4).clamp(-8, 8);
                final rightColumn = (value * 1.8).clamp(-8, 8);
                final padding;
                if (value < 0.0 || value > 0.0) {
                  padding = index % 2 == 0
                      ? EdgeInsets.only(
                          top: 20.0 - leftColumn, bottom: 20.0 + leftColumn)
                      : EdgeInsets.only(
                          top: 20.0 - rightColumn, bottom: 20.0 + rightColumn);
                } else {
                  padding = EdgeInsets.only(top: 20, bottom: 20);
                }
                return watchBox(value, padding, price[index], index);
              },
            );
          }),
    );
  }

  Widget watchBox(num value, EdgeInsets padding, String price, int i) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 300),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return DetailScreen(
                i: i,
              );
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        transform: (value != 0
            ? (Matrix4.identity()..scale(0.99, 0.99))
            : Matrix4.identity()),
        padding: padding,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fromRelativeRect(
              rect: i % 2 == 0
                  ? RelativeRect.fromLTRB(20, 75, 20, 0)
                  : RelativeRect.fromLTRB(20, 75, 20, 0),
              child: Hero(
                tag: 'bg' + i.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    color: Color(0xffe3e3e3),
                  ),
                ),
              ),
            ),
            Positioned.fromRect(
              rect: Rect.fromCenter(
                  center: Offset(100, 75), width: 150, height: 150),
              child: Hero(
                tag: 'ck' + i.toString(),
                child: Container(
                    width: 50,
                    height: 100,
                    child: Image.asset('assets/watch.png')),
              ),
            ),
            Positioned.fromRelativeRect(
              rect: RelativeRect.fromLTRB(0, width / 2.5, 0, 0),
              child: Text(
                'Heritage 1959',
                style: context.bodyText1.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned.fromRelativeRect(
              rect: RelativeRect.fromLTRB(0, width / 2.1, 0, 0),
              child: Text(
                '\$ $price',
                style: context.headline4.copyWith(
                  color: Color(0xffa67a70),
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
