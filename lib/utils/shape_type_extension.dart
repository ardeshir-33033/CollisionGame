import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_collision/models/shape.dart';

extension ShapeTypeExtension on ShapeType {
  Color get colorByShapeType {
    switch (this) {
      case ShapeType.rock:
        return Colors.grey;
      case ShapeType.paper:
        return Colors.blue;
      case ShapeType.scissor:
        return Colors.red;
    }
  }

  String get getIcon {
    switch (this) {
      case ShapeType.rock:
        return "assets/png/rock.png";
      case ShapeType.paper:
        return "assets/png/paper.png";
      case ShapeType.scissor:
        return "assets/png/scissors.png";
    }
  }

  Color get getColor {
    switch (this) {
      case ShapeType.rock:
        return Colors.grey;
      case ShapeType.paper:
        return Colors.blue;
      case ShapeType.scissor:
        return Colors.red;
    }
  }
  String get getText {
    switch (this) {
      case ShapeType.rock:
        return "Rock";
      case ShapeType.paper:
        return "Paper";
      case ShapeType.scissor:
        return "Scissor";
    }
  }
}
