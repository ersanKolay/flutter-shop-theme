import 'package:flutter/material.dart';
import '/theme/theme.dart';
import '/ui/main_screen/widgets/menu_list_widget.dart';

import '/extensions/theme_x.dart';

class MenuWidget extends StatefulWidget {
  final ValueChanged<bool>? menuChange;
  final bool? scrolling;
  const MenuWidget({Key? key, this.menuChange, this.scrolling})
      : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with TickerProviderStateMixin {
  double begin = 1;
  double end = 1;
  bool isBig = false;
  bool isNew = false;
  double barHeight = 90;
  late Animation<double> _myAnimation;
  late final AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _myAnimation = CurvedAnimation(curve: Curves.linear, parent: _controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double smallLogo = 0;
    double bigLogo = context.height * 2;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size biggest = constraints.biggest;
        return Stack(
          children: <Widget>[
            //büyüme animasyonu başladığında buton tüm sayfayı kapladığı ve
            //büyüme sırasında butonun merkezi değiştiği için
            //iki farklı widget kullanıldı PositionedTransition pozisyonunu koruyarak büyüme işlemini gerçekleştirir
            //Positioned widget üzerinde animasyon olmadığı için konumunu korur
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                    Rect.fromLTWH((context.width - smallLogo) / 2,
                        (context.height * .8), smallLogo, smallLogo),
                    biggest),
                end: RelativeRect.fromSize(
                    Rect.fromLTWH(
                        (context.width - bigLogo) / 2,
                        (context.height * .8) - (bigLogo / 2) * 0.97,
                        bigLogo,
                        bigLogo),
                    biggest),
              ).animate(_myAnimation),
              child: ClipOval(
                child: Container(
                    width: smallLogo,
                    height: smallLogo,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          ShopTheme.xBrown,
                          ShopTheme.xBrown.withOpacity(.8),
                        ],
                      ),
                    ),
                    child: Container(
                      width: 48,
                      height: 48,
                    )),
              ),
            ),
            Positioned(
              left: (context.width - 48) / 2,
              right: (context.width - 48) / 2,
              bottom: context.height * .15,
              child: Hero(
                tag: 'menu',
                child: GestureDetector(
                    onTap: () {
                      if (isBig) {
                        _controller.reverse();
                        isBig = !isBig;
                        widget.menuChange!(isBig);
                      } else {
                        _controller.forward();
                        isBig = !isBig;
                        widget.menuChange!(isBig);
                      }
                      setState(() {});
                    },
                    child: AnimatedOpacity(
                      duration: kThemeAnimationDuration,
                      opacity: !widget.scrolling! ? 1 : 0,
                      child: ClipOval(
                        child: Container(
                          width: 48,
                          height: 48,
                          color: isBig ? Colors.white : ShopTheme.xBrown,
                          child: Center(
                            child: AnimatedIcon(
                                size: 28,
                                color: !isBig ? Colors.white : ShopTheme.xBrown,
                                icon: AnimatedIcons.menu_close,
                                progress: _myAnimation),
                          ),
                        ),
                      ),
                    )),
              ),
            ),
            Positioned(
                bottom: context.height * .25,
                top: barHeight + 25,
                child: MenuListWidget(
                  isBig: isBig,
                ))
          ],
        );
      },
    );
  }
}
