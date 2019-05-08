import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import '../widgets/box.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  @override
  void initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    catAnimation = Tween(
      begin: -50.0,
      end: 100.0
    ).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cat in A Box"),),
      body: GestureDetector(
        child: Center(
          child: Stack(
            children: <Widget>[
              Box(),
              buildCatAnimation(),
            ],
          ),
        ),
        onTap: () {
          catController.status == AnimationStatus.completed ? catController.reverse() : catController.forward();
        },
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0,
          left: 0,
        );
      },
      child: Cat(),
    );
  }
}