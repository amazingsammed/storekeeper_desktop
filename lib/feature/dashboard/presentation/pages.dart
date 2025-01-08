import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:storekepper_desktop/feature/purchases/presentation/payment.dart';
import 'package:storekepper_desktop/feature/purchases/presentation/purchaselisting.dart';
import 'package:storekepper_desktop/feature/purchases/presentation/purchaseorder.dart';
import 'package:storekepper_desktop/feature/sales/presentation/customer.dart';
import 'package:storekepper_desktop/feature/sales/presentation/invoice.dart';
import 'package:storekepper_desktop/feature/sales/presentation/qoute.dart';
import 'package:storekepper_desktop/feature/sales/presentation/salesorder.dart';

import '../../purchases/presentation/accountspayable.dart';
import '../../sales/presentation/saleslisting.dart';

final List<NavigationPaneItem> items = [
  PaneItem(
    icon: const Icon(FluentIcons.dashboard_add),
    title: const Text('Dashboard'),
    body: Container(child: Text("sammed"),),
  ),
  PaneItemSeparator(),
  PaneItemExpander(
    icon: const Icon(FluentIcons.sell),
    title: const Text('Sales'),
    body: Saleslisting(),
    items: [
      PaneItem(
        icon: const Icon(FluentIcons.list),
        title: const Text('Sales List'),
        body: Saleslisting(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.quotes),
        title: const Text('Quote'),
        body: QuotePage(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.invoice),
        title: const Text('Invoice'),
        body: InvoicePage(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.order_lock),
        title: const Text('Sales Orders'),
        body: SalesOrder(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.user_followed),
        title: const Text('Customer'),
        body: CustomerPage(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.mail),
        title: const Text('Sales Refund'),
        body: Container(),
      ),

    ],
  ),
  PaneItemExpander(
    icon: const Icon(FluentIcons.inbox),
    title: const Text('Purchases'),
    body: Container(),
    items: [
      PaneItem(
        icon: const Icon(FluentIcons.mail),
        title: const Text('Purchase List'),
        body: PurchaseListing(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.calendar),
        title: const Text('Purchase Order'),
        body: PurchaseOrder(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.calendar),
        title: const Text('Account Payable'),
        body: AccountsPayable(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.calendar),
        title: const Text('Payment'),
        body: PaymentPage(),
      ),
    ],
  ),
  PaneItemExpander(
    icon: const Icon(Icons.inventory),
    title: const Text('Items'),
    body: Container(),
    items: [
      PaneItem(
        icon: const Icon(Icons.inventory_2_outlined),
        title: const Text('Items'),
        body: Container(),
      ),
      PaneItem(
        icon: const Icon(Icons.category),
        title: const Text('Category'),
        body: Container(),
      ),
      PaneItem(
        icon: const Icon(Icons.group_work),
        title: const Text('Group'),
        body: Container(),
      ),
      PaneItem(
        icon: const Icon(Icons.scatter_plot),
        title: const Text('units'),
        body: Container(),
      ),
    ],
  ),
  PaneItemExpander(
    icon: const Icon(Icons.report),
    title: const Text('Report'),
    body: Container(),
    items: [
      PaneItem(
        icon: const Icon(FluentIcons.mail),
        title: const Text('Items'),
        body: Container(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.mail),
        title: const Text('Sales'),
        body: Container(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.mail),
        title: const Text('Purchases'),
        body: Container(),
      )
    ],
  ),
  // PaneItemExpander(
  //   icon: const Icon(Icons.format_indent_decrease),
  //   title: const Text('Voucher'),
  //   body: Container(),
  //   items: [
  //     PaneItem(
  //       icon: const Icon(FluentIcons.mail),
  //       title: const Text('Sales'),
  //       body: Container(),
  //     ),
  //     PaneItem(
  //       icon: const Icon(FluentIcons.calendar),
  //       title: const Text('Purchases'),
  //       body: Container(),
  //     ),
  //     PaneItem(
  //       icon: const Icon(FluentIcons.calendar),
  //       title: const Text('Payment'),
  //       body: Container(),
  //     ),
  //     PaneItem(
  //       icon: const Icon(FluentIcons.calendar),
  //       title: const Text('Receipt'),
  //       body: Container(),
  //     ),
  //   ],
  // ),

  // PaneItem(
  //   icon: const Icon(FluentIcons.issue_tracking),
  //   title: const Text('Track orders'),
  //   infoBadge: const InfoBadge(source: Text('8')),
  //   body:  Container(),
  // ),
  // PaneItem(
  //   icon: const Icon(FluentIcons.disable_updates),
  //   title: const Text('Disabled Item'),
  //   body: Container(),
  //   enabled: false,
  // ),
  // PaneItemExpander(
  //   icon: const Icon(FluentIcons.account_management),
  //   title: const Text('Account'),
  //   body: Container(),
  //   items: [
  //     PaneItemHeader(header: const Text('Apps')),
  //     PaneItem(
  //       icon: const Icon(FluentIcons.mail),
  //       title: const Text('Mail'),
  //       body:  Container(),
  //     ),
  //     PaneItem(
  //       icon: const Icon(FluentIcons.calendar),
  //       title: const Text('Calendar'),
  //       body:  Container(),
  //     ),
  //   ],
  // ),
  // PaneItemWidgetAdapter(
  //   child: Builder(builder: (context) {
  //     // Build the widget depending on the current display mode.
  //     //
  //     // This already returns the resolved auto display mode.
  //     if (NavigationView.of(context).displayMode == PaneDisplayMode.compact) {
  //       return const FlutterLogo();
  //     }
  //     return ConstrainedBox(
  //       // Constraints are required for top display mode, otherwise the Row will
  //       // expand to the available space.
  //       constraints: const BoxConstraints(maxWidth: 200.0),
  //       child: const Row(children: [
  //         FlutterLogo(),
  //         SizedBox(width: 6.0),
  //         Text('This is a custom widget'),
  //       ]),
  //     );
  //   }),
  // ),
];