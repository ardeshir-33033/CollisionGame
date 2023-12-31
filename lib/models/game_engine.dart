import 'package:rock_paper_scissors_collision/models/shape.dart';

abstract class GameEngine {
  void initializeGame();

  void addNewShape(ShapeType shapeType);

  void startGameLoop();

  void updateMovements();

  double updateShapeXAlignment(Shape shape);

  double updateShapeYAlignment(Shape shape);

  void checkForCollision();

  void resolveCollision(Shape shape1, Shape shape2);

  void resolveBouncing(Shape shape1, Shape shape2);
}
