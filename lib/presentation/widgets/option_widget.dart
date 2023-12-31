import 'package:flutter/material.dart';

class ShapeOptionWidget extends StatelessWidget {
  final VoidCallback onAdd;
  final String icon;
  final Color color;
  final String text;

  const ShapeOptionWidget({
    Key? key,
    required this.onAdd,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onAdd,
      // child: Container(
      //   color: color,
      //   child: Text(text),
      // ),
      icon: Image.asset(
        icon,
        height: 30,
        width: 30,
        fit: BoxFit.fill,
      ),
    );
  }
}
