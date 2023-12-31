import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_collision/models/shape.dart';
import 'package:rock_paper_scissors_collision/utils/context_extension.dart';

extension ShapeObjExt on Shape {
  bool isCollide(Shape shapeObj, BuildContext context) {
    Rect rect = Rect.fromCenter(
      center:
          alignment.alongSize(Size(context.screenWidth, context.screenHeight)),
      width: width,
      height: width,
    );

    Rect rect2 = Rect.fromCenter(
      center: shapeObj.alignment
          .alongSize(Size(context.screenWidth, context.screenHeight)),
      width: width,
      height: width,
    );

    return rect.overlaps(rect2);
  }

  void changeXDirection() {
    if (xMove == ShapeXMove.left) {
      xMove = ShapeXMove.right;
    } else {
      xMove = ShapeXMove.left;
    }
  }

  void changeYDirection() {
    if (yMove == ShapeYMove.top) {
      yMove = ShapeYMove.bottom;
    } else {
      yMove = ShapeYMove.top;
    }
  }

}
