import 'dart:math';

import 'package:flutter/material.dart';

enum ShapeXMove { left, right }

enum ShapeYMove { top, bottom }

enum ShapeType { rock, paper, scissor }

class Shape {
  Alignment alignment;
  ShapeXMove xMove;
  ShapeYMove yMove;
  double width;
  ShapeType shapeType;

  Shape({
    required this.alignment,
    required this.xMove,
    required this.yMove,
    required this.shapeType,
    this.width = 50,
  });

  factory Shape.random(ShapeType shapeType) {
    ShapeXMove horizontalMove =
        Random().nextBool() ? ShapeXMove.right : ShapeXMove.left;
    ShapeYMove verticalMove =
        Random().nextBool() ? ShapeYMove.top : ShapeYMove.bottom;
    Alignment alignment = Alignment(
        (Random().nextBool() ? -1 : 1) * Random().nextDouble(),
        (Random().nextBool() ? -1 : 1) * Random().nextDouble());
    return Shape(
      alignment: alignment,
      xMove: horizontalMove,
      yMove: verticalMove,
      shapeType: shapeType,
    );
  }
}
