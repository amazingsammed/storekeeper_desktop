

class Accounting{
  int id;
  String voucher_uuid;
  String vouchername;
  String account_uuid;
  double amount;
  int status;
  int is_active;
  int is_system;
  String storeid;
  String createdby;
  DateTime date;

//<editor-fold desc="Data Methods">
  Accounting({
    required this.id,
    required this.voucher_uuid,
    required this.vouchername,
    required this.account_uuid,
    required this.amount,
    required this.status,
    required this.is_active,
    required this.is_system,
    required this.storeid,
    required this.createdby,
    required this.date,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Accounting &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          voucher_uuid == other.voucher_uuid &&
          vouchername == other.vouchername &&
          account_uuid == other.account_uuid &&
          amount == other.amount &&
          status == other.status &&
          is_active == other.is_active &&
          is_system == other.is_system &&
          storeid == other.storeid &&
          createdby == other.createdby &&
          date == other.date);

  @override
  int get hashCode =>
      id.hashCode ^
      voucher_uuid.hashCode ^
      vouchername.hashCode ^
      account_uuid.hashCode ^
      amount.hashCode ^
      status.hashCode ^
      is_active.hashCode ^
      is_system.hashCode ^
      storeid.hashCode ^
      createdby.hashCode ^
      date.hashCode;

  @override
  String toString() {
    return 'Accounting{' +
        ' id: $id,' +
        ' voucher_uuid: $voucher_uuid,' +
        ' vouchername: $vouchername,' +
        ' account_uuid: $account_uuid,' +
        ' amount: $amount,' +
        ' status: $status,' +
        ' is_active: $is_active,' +
        ' is_system: $is_system,' +
        ' storeid: $storeid,' +
        ' createdby: $createdby,' +
        ' date: $date,' +
        '}';
  }

  Accounting copyWith({
    int? id,
    String? voucher_uuid,
    String? vouchername,
    String? account_uuid,
    double? amount,
    int? status,
    int? is_active,
    int? is_system,
    String? storeid,
    String? createdby,
    DateTime? date,
  }) {
    return Accounting(
      id: id ?? this.id,
      voucher_uuid: voucher_uuid ?? this.voucher_uuid,
      vouchername: vouchername ?? this.vouchername,
      account_uuid: account_uuid ?? this.account_uuid,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      is_active: is_active ?? this.is_active,
      is_system: is_system ?? this.is_system,
      storeid: storeid ?? this.storeid,
      createdby: createdby ?? this.createdby,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'voucher_uuid': this.voucher_uuid,
      'vouchername': this.vouchername,
      'account_uuid': this.account_uuid,
      'amount': this.amount,
      'status': this.status,
      'is_active': this.is_active,
      'is_system': this.is_system,
      'storeid': this.storeid,
      'createdby': this.createdby,
      'date': this.date.toIso8601String(),
    };
  }

  factory Accounting.fromMap(Map<String, dynamic> map) {
    return Accounting(
      id: map['id'] as int,
      voucher_uuid: map['voucher_uuid'] as String,
      vouchername: map['vouchername'] as String,
      account_uuid: map['account_uuid'] as String,
      amount: map['amount'] as double,
      status: map['status'] as int,
      is_active: map['is_active'] as int,
      is_system: map['is_system'] as int,
      storeid: map['storeid'] as String,
      createdby: map['createdby'] as String,
      date: map['date'] as DateTime,
    );
  }

//</editor-fold>
}