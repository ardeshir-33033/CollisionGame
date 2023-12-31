import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_collision/models/shape.dart';
import 'package:rock_paper_scissors_collision/utils/shape_type_extension.dart';

class ShapeWidget extends StatelessWidget {
  final Shape shape;

  const ShapeWidget({
    Key? key,
    required this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: shape.alignment,
      child: Container(
        height: shape.width,
        width: shape.width,
        color: shape.shapeType.getColor,
        child: Center(
            child: Text(
          shape.shapeType.getText,
          style: const TextStyle(fontSize: 8),
        )),
      ),
    );
  }
}
