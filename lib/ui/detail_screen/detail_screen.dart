import 'package:flutter/material.dart';
import '/extensions/theme_x.dart';
import '/theme/theme.dart';
import '/ui/detail_screen/widget/about_widget.dart';
import '/ui/main_screen/widgets/topbar_widget.dart';

class DetailScreen extends StatefulWidget {
  final int i;
  const DetailScreen({Key? key, required this.i}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  bool goAnimate = false;
  bool showText = false;
  bool about = false;
  double barHeight = 90;
  late AnimationController _animationController;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 200), () {
      goAnimate = true;
      setState(() {});
    });
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Hero(
              tag: 'bg' + widget.i.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Color(0xffe3e3e3),
                ),
              ),
            ),
          ),
          Positioned(
            top: context.height * .13,
            left: 0,
            right: 0,
            child: Hero(
              tag: 'ck' + widget.i.toString(),
              child: AnimatedOpacity(
                duration: kThemeAnimationDuration,
                opacity: about ? 0 : 1,
                child: Container(
                    width: context.height * .4,
                    height: context.height * .4,
                    child: Image.asset('assets/watch.png')),
              ),
            ),
          ),
          Positioned(
            top: context.height * .54,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: kThemeAnimationDuration,
              opacity: about ? 0 : 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Heritage 1959',
                      style: context.headline4.copyWith(color: Colors.black),
                    ),
                  ),
                  Text('\$ 342',
                      style:
                          context.headline1.copyWith(color: ShopTheme.xBrown)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'MOVEMENT: ',
                                style: context.headline6
                                    .copyWith(color: Colors.black)),
                            TextSpan(
                                text: 'Japanese Quartz Movement',
                                style: context.bodyText2)
                          ]),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'CASE: ',
                                style: context.headline6
                                    .copyWith(color: Colors.black)),
                            TextSpan(
                                text: '40 mm polished stainless steel',
                                style: context.bodyText2)
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.ease,
            bottom: context.height * .15,
            right: goAnimate ? 30 : (context.width - 48) / 2,
            left: goAnimate ? (context.width - 78) : (context.width - 48) / 2,
            child: ClipOval(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 48,
                  height: 48,
                  color: ShopTheme.xBrown,
                  child: Center(
                    child: Icon(
                      Icons.bookmark_border,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            duration: Duration(
              milliseconds: 1000,
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: context.height * .04,
              child: GestureDetector(
                onTap: () {
                  about = true;
                  _animationController.forward();

                  print(about);
                  setState(() {});
                },
                child: Column(
                  children: [
                    Text('ABOUT'),
                    Icon(
                      Icons.more_vert_outlined,
                    ),
                  ],
                ),
              )),
          AnimatedPositioned(
              curve: Curves.easeIn,
              left: 0,
              right: 0,
              top: about ? context.height - (context.height * .78) : context.height,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: context.width,
                height: context.height * 0.85,
                child: AboutWidget(),
              ),
              duration: Duration(milliseconds: 400)),
          AnimatedPositioned(
              onEnd: () {
                showText = true;
                setState(() {});
              },
              duration: Duration(
                milliseconds: about ? 480 : 300,
              ),
              bottom: about ? (context.height + 0) * .75 : context.height * .15,
              left: about && _animationController.isCompleted
                  ? 80
                  : goAnimate
                      ? context.width - (context.width - 88)
                      : context.width / 2,
              right: about && _animationController.isCompleted
                  ? 80
                  : goAnimate
                      ? context.width - (context.width - 88)
                      : context.width / 2,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 800),
                width: about
                    ? context.width - 100
                    : goAnimate
                        ? context.width - 200
                        : 0,
                height: 48,
                decoration: BoxDecoration(
                    boxShadow: [
                      about && _animationController.isCompleted
                          ? BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 3.0),
                              blurRadius: 8.0,
                            )
                          : BoxShadow()
                    ],
                    color: ShopTheme.xBrown,
                    borderRadius: BorderRadius.circular(24)),
                child: AnimatedOpacity(
                  opacity: showText ? 1 : 0,
                  duration: kThemeAnimationDuration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        about && _animationController.isCompleted
                            ? AnimatedContainer(
                                duration: kThemeAnimationDuration,
                                child: Container(
                                  width:
                                      about && _animationController.isCompleted
                                          ? 50
                                          : 0,
                                  child: Text('\$ 342',
                                      style: context.subtitle1
                                          .copyWith(color: Colors.white),
                                      textAlign: TextAlign.center),
                                ),
                              )
                            : Container(),
                        Text(' ADD TO CART ',
                            style:
                                context.subtitle1.copyWith(color: Colors.white),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              )),
          AnimatedPositioned(
            curve: Curves.ease,
            bottom: context.height * .15,
            left: goAnimate ? 30 : (context.width - 48) / 2,
            right: goAnimate ? (context.width - 78) : (context.width - 48) / 2,
            child: Hero(
              tag: 'menu',
              child: ClipOval(
                child: GestureDetector(
                  onTap: () {
                    if (about) {
                      about = !about;
                      _animationController.reverse();
                      setState(() {});
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    color: ShopTheme.xBrown,
                    child: Center(
                      child: RotationTransition(
                        turns: Tween(begin: 0.0, end: -.25)
                            .animate(_animationController),
                        child: Icon(
                          Icons.keyboard_backspace_rounded,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            duration: Duration(
              milliseconds: 1000,
            ),
          ),
          TopbarWidget(
            barHeight: barHeight,
            isBig: false,
          )
        ],
      ),
    );
  }
}
