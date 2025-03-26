

class Inventory{
  int id;
  String voucher_uuid;
  String item_uuid;
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
    required this.voucher_uuid,
    required this.item_uuid,
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
          voucher_uuid == other.voucher_uuid &&
          item_uuid == other.item_uuid &&
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
      voucher_uuid.hashCode ^
      item_uuid.hashCode ^
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
        ' voucher_uuid: $voucher_uuid,' +
        ' item_uuid: $item_uuid,' +
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
    String? voucher_uuid,
    String? item_uuid,
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
      voucher_uuid: voucher_uuid ?? this.voucher_uuid,
      item_uuid: item_uuid ?? this.item_uuid,
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
      'voucher_uuid': voucher_uuid,
      'item_uuid': item_uuid,
      'quantity': quantity,
      'rate': rate,
      'amount': amount,
      'status': status,
      'storeid': storeid,
      'createdby': createdby,
      'date': date.toIso8601String(),
    };
  }

  factory Inventory.fromMap(Map<String, dynamic> map) {
    return Inventory(
      id: map['id'] as int,
      voucher_uuid: map['voucher_uuid'] as String,
      item_uuid: map['item_uuid'] as String,
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