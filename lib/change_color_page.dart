import 'dart:math';

import 'package:flutter/material.dart';

/// Page with main task
class ChangeColorPage extends StatefulWidget {
  @override
  State<ChangeColorPage> createState() => _ChangeColorPageState();
}

class _ChangeColorPageState extends State<ChangeColorPage> {
  static const int maxParametrForColor = 256;
  static const int halfParametrForColor = 127;
  static const int numberForChangeColor = 2;
  static const double sizeForTextAppBar = 16;
  static const double sizeForTextMainScreen = 26;

  Color primiryColor = const Color.fromRGBO(0, 0, 0, 1);
  Color submainColor = const Color.fromRGBO(255, 2555, 255, 1);

  int createRandomNumber(int num) {
    final random = Random();
    final int randNumber = random.nextInt(num);

    return randNumber;
  }

  void changePrimiryColor() {
    setState(() {
      primiryColor = Color.fromRGBO(
        createRandomNumber(maxParametrForColor),
        createRandomNumber(maxParametrForColor),
        createRandomNumber(maxParametrForColor),
        1,
      );
    });
  }

  void changeSubmainColor() {
    setState(() {
      submainColor = Color.fromRGBO(
        parametrsForSubmainColor(primiryColor.red),
        parametrsForSubmainColor(primiryColor.green),
        parametrsForSubmainColor(primiryColor.blue),
        1,
      );
    });
  }

  int parametrsForSubmainColor(int fromColorBackground) {
    return fromColorBackground > halfParametrForColor
        ? (fromColorBackground / numberForChangeColor).round()
        : fromColorBackground * numberForChangeColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changePrimiryColor();
        changeSubmainColor();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Test Task',
          ),
          titleTextStyle: TextStyle(
            color: primiryColor,
            fontWeight: FontWeight.bold,
            fontSize: sizeForTextAppBar,
          ),
          backgroundColor: submainColor,
        ),
        backgroundColor: primiryColor,
        body: Center(
          child: Text(
            'Hey there',
            style: TextStyle(
              color: submainColor,
              fontWeight: FontWeight.bold,
              fontSize: sizeForTextMainScreen,
            ),
          ),
        ),
      ),
    );
  }
}
