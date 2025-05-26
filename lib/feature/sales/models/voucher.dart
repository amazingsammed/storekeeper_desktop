class Voucher {
  final int id;
  final String uuid;
  final DateTime date;
  final int voucher_type;
  final double amount;
  final String narration;
  final String party_name;
  final int is_invoice;
  final int is_accounting_voucher;
  final int is_inventory_voucher;
  final int is_order_voucher;
  final String createdby;
  final String storeid;
  final int status;
  final int is_active;

//<editor-fold desc="Data Methods">
  const Voucher({
    required this.id,
    required this.uuid,
    required this.date,
    required this.voucher_type,
    required this.amount,
    required this.narration,
    required this.party_name,
    required this.is_invoice,
    required this.is_accounting_voucher,
    required this.is_inventory_voucher,
    required this.is_order_voucher,
    required this.createdby,
    required this.storeid,
    required this.status,
    required this.is_active,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Voucher &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          uuid == other.uuid &&
          date == other.date &&
          voucher_type == other.voucher_type &&
          amount == other.amount &&
          narration == other.narration &&
          party_name == other.party_name &&
          is_invoice == other.is_invoice &&
          is_accounting_voucher == other.is_accounting_voucher &&
          is_inventory_voucher == other.is_inventory_voucher &&
          is_order_voucher == other.is_order_voucher &&
          createdby == other.createdby &&
          storeid == other.storeid &&
          status == other.status &&
          is_active == other.is_active);

  @override
  int get hashCode =>
      id.hashCode ^
      uuid.hashCode ^
      date.hashCode ^
      voucher_type.hashCode ^
      amount.hashCode ^
      narration.hashCode ^
      party_name.hashCode ^
      is_invoice.hashCode ^
      is_accounting_voucher.hashCode ^
      is_inventory_voucher.hashCode ^
      is_order_voucher.hashCode ^
      createdby.hashCode ^
      storeid.hashCode ^
      status.hashCode ^
      is_active.hashCode;

  @override
  String toString() {
    return 'Voucher{' +
        ' id: $id,' +
        ' uuid: $uuid,' +
        ' date: $date,' +
        ' voucher_type: $voucher_type,' +
        ' amount: $amount,' +
        ' narration: $narration,' +
        ' party_name: $party_name,' +
        ' is_invoice: $is_invoice,' +
        ' is_accounting_voucher: $is_accounting_voucher,' +
        ' is_inventory_voucher: $is_inventory_voucher,' +
        ' is_order_voucher: $is_order_voucher,' +
        ' createdby: $createdby,' +
        ' storeid: $storeid,' +
        ' status: $status,' +
        ' is_active: $is_active,' +
        '}';
  }

  Voucher copyWith({
    int? id,
    String? uuid,
    DateTime? date,
    int? voucher_type,
    double? amount,
    String? narration,
    String? party_name,
    int? is_invoice,
    int? is_accounting_voucher,
    int? is_inventory_voucher,
    int? is_order_voucher,
    String? createdby,
    String? storeid,
    int? status,
    int? is_active,
  }) {
    return Voucher(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      date: date ?? this.date,
      voucher_type: voucher_type ?? this.voucher_type,
      amount: amount ?? this.amount,
      narration: narration ?? this.narration,
      party_name: party_name ?? this.party_name,
      is_invoice: is_invoice ?? this.is_invoice,
      is_accounting_voucher:
          is_accounting_voucher ?? this.is_accounting_voucher,
      is_inventory_voucher: is_inventory_voucher ?? this.is_inventory_voucher,
      is_order_voucher: is_order_voucher ?? this.is_order_voucher,
      createdby: createdby ?? this.createdby,
      storeid: storeid ?? this.storeid,
      status: status ?? this.status,
      is_active: is_active ?? this.is_active,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uuid': uuid,
      'date': date.toIso8601String(),
      'voucher_type': voucher_type,
      'amount': amount,
      'narration': narration,
      'party_name': party_name,
      'is_invoice': is_invoice,
      'is_accounting_voucher': is_accounting_voucher,
      'is_inventory_voucher': is_inventory_voucher,
      'is_order_voucher': is_order_voucher,
      'createdby': createdby,
      'storeid': storeid,
      'status': status,
      'is_active': is_active,
    };
  }

  factory Voucher.fromMap(Map<String, dynamic> map) {
    return Voucher(
      id: map['id'] as int,
      uuid: map['uuid'] as String,
      date: DateTime.parse(map['date']),
      voucher_type: map['voucher_type'] as int,
      amount: double.parse(map['amount'].toString()),
      narration: map['narration'] as String,
      party_name: map['party_name'] as String,
      is_invoice: map['is_invoice'] as int,
      is_accounting_voucher: map['is_accounting_voucher'] as int,
      is_inventory_voucher: map['is_inventory_voucher'] as int,
      is_order_voucher: map['is_order_voucher'] as int,
      createdby: map['createdby'] as String,
      storeid: map['storeid'] as String,
      status: map['status'] as int,
      is_active: map['is_active'] as int,
    );
  }

//</editor-fold>
}
