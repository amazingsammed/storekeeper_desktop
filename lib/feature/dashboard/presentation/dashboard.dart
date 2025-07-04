//  
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dashboardcontroller.dart';
import '_component/menu_bar.dart';


class MainDashboard extends StatelessWidget {
  DashboardController controller = Get.put(DashboardController(),permanent: true);

  MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Row(
          children: [
            NavigationRail(
              labelType: NavigationRailLabelType.all,
              leading: const FlutterLogo(size: 40,),
              destinations:navItems.map((element)=>NavigationRailDestination(
                  icon: Icon(element.icon), label: Text(element.title))).toList(),
              selectedIndex: controller.selectedPage.value,
              onDestinationSelected: (index) {
                controller.selectedPage.value = index;
              },),
            Expanded(child: IndexedStack(
              index: controller.selectedPage.value,
              children: navItems.map((element)=>MyMainPage(tabs: element.tabs,)).toList(),
            ))

          ],
        );
      }),
    );
  }
}

class MyMainPage extends StatefulWidget {
  final List<MyTabBar> tabs;
  const MyMainPage({super.key, required this.tabs});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    tabController= TabController(length: widget.tabs.length, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
            padding: EdgeInsets.zero,
            labelColor: Colors.black,
            dividerColor: Colors.black12,
            controller: tabController,
            isScrollable: true,
            tabs: widget.tabs.map((element)=>Tab(text: element.title,)).toList()),
      ),
      body: TabBarView(controller:tabController,children: widget.tabs.map((element)=>element.body).toList() ),
    );
  }
}

