import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wcars/app/constants/route_name.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, RouteName.vitrine);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeContainerHeight = (MediaQuery.of(context).size.height);
    final sizeContainerWidth = (MediaQuery.of(context).size.width);

    return Scaffold(
        body: SizedBox(
      height: sizeContainerHeight,
      width: sizeContainerWidth,
      // color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('W-Cars'),
        ],
      ),
    ));
  }
}
