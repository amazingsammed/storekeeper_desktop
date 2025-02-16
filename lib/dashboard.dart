import 'package:flutter/material.dart';

class DashBoardwithTabs extends StatefulWidget {
  const DashBoardwithTabs({super.key});

  @override
  State<DashBoardwithTabs> createState() => _DashBoardwithTabsState();
}

class _DashBoardwithTabsState extends State<DashBoardwithTabs>
    with SingleTickerProviderStateMixin {
  late TabController tabBarController;

  @override
  void initState() {
    tabBarController = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: double.maxFinite,
            child: TabBar(
              padding: EdgeInsets.zero,
                indicatorColor: Colors.blue,
                indicator: BoxDecoration(
                  color: Colors.transparent,
                ),
                isScrollable: true,
                controller: tabBarController,
                tabs: [
                  Tab(
                    child: Text("data"),
                  ),
                  Tab(
                    child: Text("data"),
                  ),
                  Tab(
                    child: Text("data"),
                  ),
                ]),
          ),
          Expanded(
              child: TabBarView(controller: tabBarController, children: [
            Container(
              child: Text("Body 1"),
            ),
            Container(
              child: Text("Body 2"),
            ),
            Container(
              child: Text("Body 3"),
            )
          ]))
        ],
      ),
    ));
  }
}


