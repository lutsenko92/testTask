import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_task/change_color_page.dart';
import 'package:test_task/change_color_provider.dart';

/// Start Project
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiProvider(
            providers: [
              ChangeNotifierProvider<SquareProvider>.value(
                  value: SquareProvider()),
            ],
            child: DefaultTabController(
              length: listPagesForTabs.length,
              child: Scaffold(
                bottomNavigationBar: Container(
                  color: Colors.blueGrey,
                  child: TabBar(
                      overlayColor: MaterialStateProperty.all(Colors.green),
                      dividerColor: Colors.blue,
                      indicatorColor: Colors.brown,
                      automaticIndicatorColorAdjustment: false,
                      tabs: [
                        Tab(icon: Icon(Icons.battery_charging_full_outlined)),
                        Tab(icon: Icon(Icons.ac_unit))
                      ]),
                ),
                body: TabBarView(
                  children: listPagesForTabs,
                ),
              ),
            ))

        // ChangeColorPage(),
        );
  }
}

final listPagesForTabs = [
  ChangeColorPage(),
  ChangeColorProvider(),
];
