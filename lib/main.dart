import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_collision/presentation/pages/game_page.dart';

void main() {
  // runApp(const MyApp());

  double x = detect("1+2-1");
  // double x = powerType2(5, 2);
  print(x);
}

power(double x, double n) {
  if (n == 0) {
    return 1;
  } else {
    if (x % 2 == 0) {
      return x * power(x, n / 2);
    } else {
      return x * power(x, (n - 1) / 2);
    }
  }
}

powerType2(double x, double n) {
  if (n == 0) {
    return 1;
  } else {
    return x * powerType2(x, n - 1);
  }
}

detect(String math) {
  List<int> numbers = [];
  List<String> operators = [];
  double finalNumber = 0;

  for (int i = 0; i < math.length; i++) {
    if (math[i] == "+" || math[i] == "-") {
      operators.add(math[i]);
    } else {
      numbers.add(int.parse(math[i]));
    }
  }

  for (int j = 0; j < operators.length; j++) {
    if (operators[j] == "+") {
      finalNumber = (finalNumber + numbers[j]).toDouble();
    } else {
      print(numbers[j]);

      print(numbers[j + 1]);
      finalNumber = finalNumber - (numbers[j + 1]).toDouble();
    }
  }

  // if (math.contains("-")) {
  //   List<String> numbersList = math.split("-");
  //   for (var element in numbersList) {
  //     numbers.add(int.parse(element));
  //   }
  //   for (int i = 0; i < numbersList.length - 1; i++) {
  //     finalNumber = (numbers[i] - numbers[i + 1]).toDouble();
  //   }
  // }
  // if (math.contains("+")) {
  //   List<String> numbersList = math.split("+");
  //   for (var element in numbersList) {
  //     numbers.add(int.parse(element));
  //   }
  //   for (int i = 0; i < numbersList.length - 1; i++) {
  //     finalNumber = (numbers[i] + numbers[i + 1]).toDouble();
  //   }
  // }
  return finalNumber;
}

StringContainsOperator() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
