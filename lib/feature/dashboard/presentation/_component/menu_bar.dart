import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:storekepper_desktop/feature/items/presentation/itemlist.dart';
import 'package:storekepper_desktop/feature/purchases/presentation/purchaselisting.dart';
import 'package:storekepper_desktop/feature/sales/presentation/saleslisting.dart';

import '../../../items/presentation/category.dart';
import '../../../items/presentation/group.dart';
import '../../../items/presentation/units.dart';
import '../../../purchases/presentation/accountspayable.dart';
import '../../../purchases/presentation/payment.dart';
import '../../../purchases/presentation/purchaseorder.dart';
import '../../../sales/presentation/customer.dart';
import '../../../sales/presentation/invoice.dart';
import '../../../sales/presentation/qoute.dart';
import '../../../sales/presentation/salesorder.dart';

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
    MyTabBar(title: 'Dashboard', icon: Icons.dashboard, body: Container())
  ]),
  MainNavigation(title: 'Sales', icon: Icons.shopping_bag, tabs: [
    MyTabBar(title: 'Sale Listing', icon: Icons.list, body: Saleslisting()),
    MyTabBar(
      icon: FluentIcons.quotes,
      title: 'Quote',
      body: QuotePage(),
    ),
    MyTabBar(
      icon: FluentIcons.invoice,
      title: 'Invoice',
      body: InvoicePage(),
    ),
    MyTabBar(
      icon: FluentIcons.order_lock,
      title: 'Sales Orders',
      body: SalesOrder(),
    ),
    MyTabBar(
      icon: FluentIcons.user_followed,
      title: 'Customer',
      body: CustomerPage(),
    ),
    MyTabBar(
      icon: FluentIcons.mail,
      title: 'Refund',
      body: Container(),
    ),
  ]),
  MainNavigation(title: 'Purchases', icon: Icons.add_shopping_cart, tabs: [
    MyTabBar(title: 'Purchase Listing', icon: Icons.list, body: PurchaseListing()),
    MyTabBar(
      icon: FluentIcons.calendar,
      title: 'Purchase Order',
      body: PurchaseOrder(),
    ),
    MyTabBar(
      icon: FluentIcons.calendar,
      title: 'Account Payable',
      body: AccountsPayable(),
    ),
    MyTabBar(
      icon: FluentIcons.calendar,
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
  MainNavigation(title: 'Reports', icon: Icons.report, tabs: [
    MyTabBar(title: 'Dashboard', icon: Icons.dashboard, body: Container()),
    MyTabBar(
      icon: FluentIcons.mail,
      title: 'Items',
      body: Container(),
    ),
    MyTabBar(
      icon: FluentIcons.mail,
      title: 'Sales',
      body: Container(),
    ),
    MyTabBar(
      icon: FluentIcons.mail,
      title: 'Purchases',
      body: Container(),
    )
  ]),
  MainNavigation(title: 'Settings', icon: Icons.settings, tabs: [
    MyTabBar(title: 'General', icon: Icons.dashboard, body: Container())
  ]),
];
