
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          border: Border.all(color: Colors.grey)
        ),
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(title)
          ],
        ),
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
              title:"Sales",
              icon: Icons.book,
              index: 1
          ),
          ToolBarItem(
              title:"Quote",
              icon: Icons.book,
              index: 2
          ),
          ToolBarItem(
              title:"Invoice",
              icon: Icons.book,
              index: 3
          ),
          ToolBarItem(
              title:"Sales Order",
              icon: Icons.book,
              index: 4
          ),
          ToolBarItem(
              title:"Customer",
              icon: Icons.book,
              index: 5
          ),
          ToolBarItem(
              title:"Sales Refund",
              icon: Icons.book,
              index: 6
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
              title:"Purchase",
              icon: Icons.book,
              index: 1
          ),
          ToolBarItem(
              title:"Purchase Order",
              icon: Icons.book,
              index: 1
          ),
          ToolBarItem(
              title:"Account Payable",
              icon: Icons.book,
              index: 1
          ),
          ToolBarItem(
              title:"Payment",
              icon: Icons.book,
              index: 1
          ),

        ],
      ),
    );
  }
}
