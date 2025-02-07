
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';

import '../../controller/dashboardcontroller.dart';

class ToolBarItem extends StatelessWidget {
  DashboardController controller = Get.find();
  final String title;
  final IconData icon;
  final int index; 
   ToolBarItem({super.key, required this.title, required this.icon, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.selectedPage.value = index;
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: controller.selectedPage.value == index?Colors.green:Colors.grey)
        ),
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,size: 30,color:  controller.selectedPage.value == index?Colors.green:null,),
            kSizedbox5,
            Text(title,style: TextStyle(color:  controller.selectedPage.value == index?Colors.green:null,),)
          ],
        ),
      ),
    );
  }
}


class DashBoardToolBar extends StatelessWidget {
  const DashBoardToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 40 ,vertical: 10).copyWith(bottom: 0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [

          ToolBarItem(
              title:"Sales",
              icon: Icons.book,
              index: 1
          ),
          ToolBarItem(
              title:"Purchases",
              icon: Icons.quora,
              index: 7
          ),
          ToolBarItem(
              title:"Item List",
              icon: Icons.inventory_outlined,
              index: 11
          ),
          ToolBarItem(
              title:"Report",
              icon: Icons.report,
              index: 15
          ),
        ],
      ),
    );
  }
}
class SalesToolBar extends StatelessWidget {
  const SalesToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 40 ,vertical: 10).copyWith(bottom: 0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ToolBarItem(
              title:"Dashboard",
              icon: Icons.dashboard,
              index: 0
          ),
          ToolBarItem(
              title:"Sales",
              icon: Icons.book,
              index: 1
          ),
          ToolBarItem(
              title:"Quote",
              icon: Icons.quora,
              index: 2
          ),
          ToolBarItem(
              title:"Invoice",
              icon: Icons.inventory_outlined,
              index: 3
          ),
          ToolBarItem(
              title:"Sales Order",
              icon: Icons.offline_pin_rounded,
              index: 4
          ),
          ToolBarItem(
              title:"Customer",
              icon: Icons.people_alt,
              index: 5
          ),
          ToolBarItem(
              title:"Refund",
              icon: Icons.refresh,
              index: 6
          ),
        ],
      ),
    );
  }
}
class ItemToolBar extends StatelessWidget {
  const ItemToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 40 ,vertical: 10).copyWith(bottom: 0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ToolBarItem(
              title:"Dashboard",
              icon: Icons.dashboard,
              index: 0
          ),
          ToolBarItem(
              title:"Items",
              icon: Icons.inventory_2_outlined,
              index: 11
          ),
          ToolBarItem(
              title:"Category",
              icon: Icons.category,
              index: 12
          ),
          ToolBarItem(
              title:"Group",
              icon: Icons.group,
              index: 13
          ),
          ToolBarItem(
              title:"Unit",
              icon: Icons.scale,
              index: 14
          ),

        ],
      ),
    );
  }
}

class PurchasesToolBar extends StatelessWidget {
  const PurchasesToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40 ,vertical: 10).copyWith(bottom: 0),
      child: Row(
        children: [
          ToolBarItem(
              title:"Dashboard",
              icon: Icons.dashboard,
              index: 0
          ),
          ToolBarItem(
              title:"Purchase",
              icon: Icons.book,
              index: 7
          ),
          ToolBarItem(
              title:"Purchase Order",
              icon: Icons.book,
              index: 8
          ),
          ToolBarItem(
              title:"Account Payable",
              icon: Icons.book,
              index: 9
          ),
          ToolBarItem(
              title:"Payment",
              icon: Icons.book,
              index: 10
          ),

        ],
      ),
    );
  }
}



class MainPageWithToolBar extends StatelessWidget {
  final Widget toolBar;
  final Widget child;
  const MainPageWithToolBar({super.key, required this.toolBar, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      toolBar,
      Expanded(child: child)
    ],
    );
  }
}

