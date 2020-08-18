import 'package:flutter/material.dart';
import 'dart:async';
import 'package:skybuildz/components/app.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });

    _mockCheckForSession().then((status) {
      if (status) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => App()),
            (Route<dynamic> route) => false);
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 4500), () {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(20),
                    child: Opacity(
                        opacity: controller.value,
                        child: Image.asset('assets/img/logofinal.png'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
