import 'package:flutter/material.dart';
import 'package:flutter_app/screen/breakfast_screen.dart';
import 'package:flutter_app/screen/dessert_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int currentTabIndex;
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    currentTabIndex = 0;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: <Widget>[BreakfastScreen(), DessertScreen()],
      ),
      bottomNavigationBar: Material(
        color: Colors.lightGreen,
        child: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(
              text: "Breakfast",
            ),
            Tab(
              text: "Dessert",
            )
          ],
        ),
      ),
    );
  }
}