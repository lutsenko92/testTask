import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// second method with provider
class ChangeColorProvider extends StatelessWidget {
  //const ChangeColorProvider({super.key});

  @override
  Widget build(BuildContext context) {
    SquareProvider state = Provider.of<SquareProvider>(context);
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: MediaQuery.of(context).size.width / 3,
        width: MediaQuery.of(context).size.width / 3,
        color: state.primiryColor,
      ),
      Switch(
          value: state.isEnableSwitch,
          onChanged: (value) {
            state.changeSwitch();
          })
    ]);
  }
}

class SquareProvider extends ChangeNotifier {
  bool isEnableSwitch = false;
  Color primiryColor = Color.fromRGBO(
    0,
    0,
    0,
    1,
  );
  void changeSwitch() {
    isEnableSwitch = !isEnableSwitch;
    changeColor();
    notifyListeners();
  }

  void changeColor() {
    primiryColor = Color.fromRGBO(
      createRandomNumber(256),
      createRandomNumber(256),
      createRandomNumber(256),
      1,
    );
  }

  int createRandomNumber(int num) {
    final random = Random();
    final int randNumber = random.nextInt(num);

    return randNumber;
  }

  void changePrimiryColor() {}
}
