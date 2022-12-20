import 'package:flutter/material.dart';

import 'package:test_task/change_color_page.dart';

/// Start Project
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeColorPage(),
    );
  }
}
