import 'package:flutter/material.dart';

class Cat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network('https://i.imgur.com/QwhZRyL.png');
    /*return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/cat.png')
        )
      ),
    );*/
  }
}