

import 'package:flutter/material.dart';
import 'package:storekepper_desktop/feature/dashboard/presentation/_component/toolbarItem.dart';

class MyDashBoard extends StatelessWidget {
  const MyDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPageWithToolBar(toolBar: DashBoardToolBar(), child: Container());

  }
}
