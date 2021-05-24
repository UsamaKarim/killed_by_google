import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 250,
            height: 250,
            decoration: ShapeDecoration(
                shape: CircleBorder(side: BorderSide(width: 10))),
            child: CircleAvatar())
      ],
    );
  }
}
