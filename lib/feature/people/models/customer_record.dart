

import 'package:storekepper_desktop/feature/people/models/chatofaccounts.dart';
import 'package:storekepper_desktop/feature/people/models/customer_model.dart';

class CustomerRecord{
  ChatofAccounts accounts;
  CustomerModel customer;

//<editor-fold desc="Data Methods">
  CustomerRecord({
    required this.accounts,
    required this.customer,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerRecord &&
          runtimeType == other.runtimeType &&
          accounts == other.accounts &&
          customer == other.customer);

  @override
  int get hashCode => accounts.hashCode ^ customer.hashCode;

  @override
  String toString() {
    return 'CustomerRecord{' +
        ' accounts: $accounts,' +
        ' customer: $customer,' +
        '}';
  }

  CustomerRecord copyWith({
    ChatofAccounts? accounts,
    CustomerModel? customer,
  }) {
    return CustomerRecord(
      accounts: accounts ?? this.accounts,
      customer: customer ?? this.customer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accounts': this.accounts,
      'customer': this.customer,
    };
  }

  factory CustomerRecord.fromMap(Map<String, dynamic> map) {
    return CustomerRecord(
      accounts: map['accounts'] as ChatofAccounts,
      customer: map['customer'] as CustomerModel,
    );
  }

//</editor-fold>
}