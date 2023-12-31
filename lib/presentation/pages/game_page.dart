import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_collision/models/game_engine.dart';
import 'package:rock_paper_scissors_collision/models/shape.dart';
import 'package:rock_paper_scissors_collision/presentation/widgets/option_widget.dart';
import 'package:rock_paper_scissors_collision/presentation/widgets/shape_widget.dart';
import 'package:rock_paper_scissors_collision/utils/shape_extensions.dart';
import 'package:rock_paper_scissors_collision/utils/shape_type_extension.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements GameEngine {
  late List<Shape> shapes;
  late int gameSpeedMilliseconds = 50;

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    startGameLoop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ...List.generate(
            shapes.length,
            (index) => ShapeWidget(
              shape: shapes[index],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Row(
                  children: List.generate(
                    ShapeType.values.length,
                    (index) => Expanded(
                      child: ShapeOptionWidget(
                          onAdd: () => addNewShape(ShapeType.values[index]),
                          color: ShapeType.values[index].getColor,
                          text: ShapeType.values[index].getText,
                          icon: ShapeType.values[index].getIcon),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initializeGame() {
    shapes = [
      Shape.random(ShapeType.scissor),
      Shape.random(ShapeType.scissor),
      Shape.random(ShapeType.scissor),
      Shape.random(ShapeType.scissor),
      Shape.random(ShapeType.scissor),
      Shape.random(ShapeType.paper),
      Shape.random(ShapeType.paper),
      Shape.random(ShapeType.paper),
      Shape.random(ShapeType.paper),
      Shape.random(ShapeType.paper),
      Shape.random(ShapeType.rock),
      Shape.random(ShapeType.rock),
      Shape.random(ShapeType.rock),
      Shape.random(ShapeType.rock),
      Shape.random(ShapeType.rock),
    ];
    // gameSpeedMilliseconds = 200;
  }

  @override
  void startGameLoop() async {
    while (true) {
      setState(() {
        checkForCollision();
        updateMovements();
      });
      await Future.delayed(Duration(milliseconds: gameSpeedMilliseconds));
    }
  }

  @override
  void checkForCollision() {
    for (int index = 0; index < shapes.length; index++) {
      for (int j = index + 1; j < shapes.length; j++) {
        if (shapes[index].isCollide(shapes[j], context)) {
          resolveCollision(shapes[index], shapes[j]);
        }
      }
    }
  }

  @override
  void addNewShape(ShapeType shapeType) {
    setState(() {
      shapes.add(Shape.random(shapeType));
    });
  }

  @override
  void updateMovements() {
    for (Shape shape in shapes) {
      shape.alignment =
          Alignment(updateShapeXAlignment(shape), updateShapeYAlignment(shape));
    }
  }

  @override
  double updateShapeXAlignment(Shape shape) {
    if (shape.xMove == ShapeXMove.left) {
      if (shape.alignment.x <= -0.9) {
        shape.xMove = ShapeXMove.right;
        return shape.alignment.x + 0.01;
      } else {
        return shape.alignment.x - 0.01;
      }
    }
    if (shape.alignment.x >= 0.9) {
      shape.xMove = ShapeXMove.left;
      return shape.alignment.x - 0.01;
    } else {
      return shape.alignment.x + 0.01;
    }
  }

  @override
  double updateShapeYAlignment(Shape shape) {
    if (shape.yMove == ShapeYMove.top) {
      if (shape.alignment.y <= -0.9) {
        shape.yMove = ShapeYMove.bottom;
        return shape.alignment.y + 0.01;
      } else {
        return shape.alignment.y - 0.01;
      }
    }
    if (shape.alignment.y >= 0.9) {
      shape.yMove = ShapeYMove.top;
      return shape.alignment.y - 0.01;
    } else {
      return shape.alignment.y + 0.01;
    }
  }

  @override
  void resolveBouncing(Shape shape1, Shape shape2) {
    if (shape1.xMove != shape2.xMove && shape1.yMove == shape2.yMove) {
      shape1.changeXDirection();
      shape2.changeXDirection();
    } else if (shape1.yMove != shape2.yMove && shape1.xMove == shape2.xMove) {
      shape1.changeYDirection();
      shape2.changeYDirection();
    } else {
      shape1.changeYDirection();
      shape1.changeXDirection();
      shape2.changeYDirection();
      shape2.changeXDirection();
    }
  }

  @override
  void resolveCollision(Shape shape1, Shape shape2) {
    if (shape1.shapeType == shape2.shapeType) {
      resolveBouncing(shape1, shape2);
      return;
    }
    switch (shape1.shapeType) {
      case ShapeType.rock:
        if (shape2.shapeType == ShapeType.scissor) {
          shapes.remove(shape2);
        } else {
          shapes.remove(shape1);
        }
        break;
      case ShapeType.paper:
        if (shape2.shapeType == ShapeType.rock) {
          shapes.remove(shape2);
        } else {
          shapes.remove(shape1);
        }
        break;
      case ShapeType.scissor:
        if (shape2.shapeType == ShapeType.paper) {
          shapes.remove(shape2);
        } else {
          shapes.remove(shape1);
        }
        break;
    }
    resolveBouncing(shape1, shape2);
  }
}
