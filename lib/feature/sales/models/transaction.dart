

import 'package:storekepper_desktop/feature/sales/models/inventory.dart';
import 'package:storekepper_desktop/feature/sales/models/voucher.dart';

import 'accounting.dart';

class MyTransaction{
  Voucher voucher;
  List<Inventory>? inventory;
  List<Accounting>? accounting;

//<editor-fold desc="Data Methods">
  MyTransaction({
    required this.voucher,
    this.inventory,
    this.accounting,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyTransaction &&
          runtimeType == other.runtimeType &&
          voucher == other.voucher &&
          inventory == other.inventory &&
          accounting == other.accounting);

  @override
  int get hashCode =>
      voucher.hashCode ^ inventory.hashCode ^ accounting.hashCode;

  @override
  String toString() {
    return 'MyTransaction{' +
        ' voucher: $voucher,' +
        ' inventory: $inventory,' +
        ' accounting: $accounting,' +
        '}';
  }

  MyTransaction copyWith({
    Voucher? voucher,
    List<Inventory>? inventory,
    List<Accounting>? accounting,
  }) {
    return MyTransaction(
      voucher: voucher ?? this.voucher,
      inventory: inventory ?? this.inventory,
      accounting: accounting ?? this.accounting,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'voucher': voucher,
      'inventory': inventory,
      'accounting': accounting,
    };
  }

  factory MyTransaction.fromMap(Map<String, dynamic> map) {
    return MyTransaction(
      voucher: map['voucher'] as Voucher,
      inventory: map['inventory'] as List<Inventory>,
      accounting: map['accounting'] as List<Accounting>,
    );
  }

//</editor-fold>
}