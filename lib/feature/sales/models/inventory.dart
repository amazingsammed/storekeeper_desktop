

class Inventory{
  int id;
  String voucherUuid;
  String itemUuid;
  double quantity;
  double rate;
  double amount;
  int status;
  String storeid;
  String createdby;
  DateTime date;

//<editor-fold desc="Data Methods">
  Inventory({
    required this.id,
    required this.voucherUuid,
    required this.itemUuid,
    required this.quantity,
    required this.rate,
    required this.amount,
    required this.status,
    required this.storeid,
    required this.createdby,
    required this.date,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Inventory &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          voucherUuid == other.voucherUuid &&
          itemUuid == other.itemUuid &&
          quantity == other.quantity &&
          rate == other.rate &&
          amount == other.amount &&
          status == other.status &&
          storeid == other.storeid &&
          createdby == other.createdby &&
          date == other.date);

  @override
  int get hashCode =>
      id.hashCode ^
      voucherUuid.hashCode ^
      itemUuid.hashCode ^
      quantity.hashCode ^
      rate.hashCode ^
      amount.hashCode ^
      status.hashCode ^
      storeid.hashCode ^
      createdby.hashCode ^
      date.hashCode;

  @override
  String toString() {
    return 'Inventory{' +
        ' id: $id,' +
        ' voucherUuid: $voucherUuid,' +
        ' itemUuid: $itemUuid,' +
        ' quantity: $quantity,' +
        ' rate: $rate,' +
        ' amount: $amount,' +
        ' status: $status,' +
        ' storeid: $storeid,' +
        ' createdby: $createdby,' +
        ' date: $date,' +
        '}';
  }

  Inventory copyWith({
    int? id,
    String? voucherUuid,
    String? itemUuid,
    double? quantity,
    double? rate,
    double? amount,
    int? status,
    String? storeid,
    String? createdby,
    DateTime? date,
  }) {
    return Inventory(
      id: id ?? this.id,
      voucherUuid: voucherUuid ?? this.voucherUuid,
      itemUuid: itemUuid ?? this.itemUuid,
      quantity: quantity ?? this.quantity,
      rate: rate ?? this.rate,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      storeid: storeid ?? this.storeid,
      createdby: createdby ?? this.createdby,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'voucherUuid': this.voucherUuid,
      'itemUuid': this.itemUuid,
      'quantity': this.quantity,
      'rate': this.rate,
      'amount': this.amount,
      'status': this.status,
      'storeid': this.storeid,
      'createdby': this.createdby,
      'date': this.date,
    };
  }

  factory Inventory.fromMap(Map<String, dynamic> map) {
    return Inventory(
      id: map['id'] as int,
      voucherUuid: map['voucherUuid'] as String,
      itemUuid: map['itemUuid'] as String,
      quantity: map['quantity'] as double,
      rate: map['rate'] as double,
      amount: map['amount'] as double,
      status: map['status'] as int,
      storeid: map['storeid'] as String,
      createdby: map['createdby'] as String,
      date: map['date'] as DateTime,
    );
  }

//</editor-fold>
}