import 'package:flutter/material.dart';
import '/theme/theme.dart';
import '/ui/main_screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ShopTheme.theme,
      home: MainScreen(),
    );
  }
}
