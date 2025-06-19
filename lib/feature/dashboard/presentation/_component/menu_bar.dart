import 'package:flutter/material.dart';
import 'package:storekepper_desktop/feature/items/presentation/itemlist.dart';
import 'package:storekepper_desktop/feature/people/presentation/suppliers.dart';
import 'package:storekepper_desktop/feature/purchases/presentation/purchaselisting.dart';
import 'package:storekepper_desktop/feature/sales/presentation/saleslisting.dart';
import 'package:storekepper_desktop/feature/settings/presentation/chartofaccounts.dart';

import '../../../items/presentation/category.dart';
import '../../../items/presentation/group.dart';
import '../../../items/presentation/units.dart';
import '../../../purchases/presentation/accountspayable.dart';
import '../../../purchases/presentation/payment.dart';
import '../../../purchases/presentation/purchaseorder.dart';
import '../../../people/presentation/customer.dart';
import '../../../sales/presentation/invoice.dart';
import '../../../sales/presentation/qoute.dart';
import '../../../sales/presentation/salesorder.dart';
import '../../../settings/presentation/settings.dart';
import '../../../settings/presentation/users.dart';
import '../dashboardpage.dart';

class MyTabBar {
  final String title;
  final IconData icon;
  final Widget body;

  MyTabBar({
    required this.title,
    required this.icon,
    required this.body,
  });
}

class MainNavigation {
  final String title;
  final IconData icon;
  final List<MyTabBar> tabs;

  const MainNavigation({
    required this.title,
    required this.icon,
    required this.tabs,
  });
}

List<MainNavigation> navItems = [
  MainNavigation(title: 'Home', icon: Icons.dashboard, tabs: [
    MyTabBar(title: 'Dashboard', icon: Icons.dashboard, body: DashboardPage())
  ]),
  MainNavigation(title: 'Sales', icon: Icons.shopping_bag, tabs: [
    MyTabBar(title: 'Sale Listing', icon: Icons.list, body: Saleslisting()),
    MyTabBar(
      icon: Icons.quora,
      title: 'Quote',
      body: QuotePage(),
    ),
    MyTabBar(
      icon: Icons.folder,
      title: 'Invoice',
      body: InvoicePage(),
    ),
    MyTabBar(
      icon: Icons.home,
      title: 'Sales Orders',
      body: SalesOrder(),
    ),
    MyTabBar(
      icon: Icons.home,
      title: 'Customer',
      body: CustomerPage(),
    ),
    MyTabBar(
      icon: Icons.home,
      title: 'Refund',
      body: Container(),
    ),
  ]),
  MainNavigation(title: 'Purchases', icon: Icons.add_shopping_cart, tabs: [
    MyTabBar(
        title: 'Purchase Listing', icon: Icons.list, body: PurchaseListing()),
    MyTabBar(
      icon: Icons.home,
      title: 'Purchase Order',
      body: PurchaseOrder(),
    ),
    MyTabBar(
      icon: Icons.home,
      title: 'Account Payable',
      body: AccountsPayable(),
    ),
    MyTabBar(
      icon: Icons.home,
      title: 'Payment',
      body: PaymentPage(),
    ),
  ]),
  MainNavigation(title: 'Inventory', icon: Icons.inventory, tabs: [
    MyTabBar(title: 'Inventory', icon: Icons.list, body: ItemListing()),
    MyTabBar(
      icon: Icons.category,
      title: 'Category',
      body: CategoryPage(),
    ),
    MyTabBar(
      icon: Icons.group_work,
      title: 'Group',
      body: GroupPage(),
    ),
    MyTabBar(
      icon: Icons.scale,
      title: 'Unit',
      body: UnitsPage(),
    ),
  ]),
  MainNavigation(title: 'People', icon: Icons.person, tabs: [
    MyTabBar(title: 'Customers', icon: Icons.person, body: CustomerPage()),
    MyTabBar(
      icon: Icons.person_2,
      title: 'Suppliers',
      body: SuppliersPage(),
    )
  ]),
  MainNavigation(title: 'Settings', icon: Icons.settings, tabs: [
    MyTabBar(title: 'General', icon: Icons.dashboard, body: GeneralPage()),
    MyTabBar(title: 'Users', icon: Icons.person, body: UsersTable()),
    MyTabBar(title: 'Chart of Accounts', icon: Icons.person, body: Chartofaccounts()),
    MyTabBar(
        title: 'About',
        icon: Icons.dashboard,
        body: Container(
          child: Center(
            child: Text('About'),
          ),
        )),
  ]),
];
