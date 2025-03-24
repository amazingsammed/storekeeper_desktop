

class Accounting{
  int id;
  String voucherUuid;
  String vouchername;
  String accountUuid;
  double amount;
  int status;
  int isActive;
  int isSystem;
  String storeid;
  String createdby;
  DateTime date;

//<editor-fold desc="Data Methods">
  Accounting({
    required this.id,
    required this.voucherUuid,
    required this.vouchername,
    required this.accountUuid,
    required this.amount,
    required this.status,
    required this.isActive,
    required this.isSystem,
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
          voucherUuid == other.voucherUuid &&
          vouchername == other.vouchername &&
          accountUuid == other.accountUuid &&
          amount == other.amount &&
          status == other.status &&
          isActive == other.isActive &&
          isSystem == other.isSystem &&
          storeid == other.storeid &&
          createdby == other.createdby &&
          date == other.date);

  @override
  int get hashCode =>
      id.hashCode ^
      voucherUuid.hashCode ^
      vouchername.hashCode ^
      accountUuid.hashCode ^
      amount.hashCode ^
      status.hashCode ^
      isActive.hashCode ^
      isSystem.hashCode ^
      storeid.hashCode ^
      createdby.hashCode ^
      date.hashCode;

  @override
  String toString() {
    return 'Accounting{' +
        ' id: $id,' +
        ' voucherUuid: $voucherUuid,' +
        ' vouchername: $vouchername,' +
        ' accountUuid: $accountUuid,' +
        ' amount: $amount,' +
        ' status: $status,' +
        ' isActive: $isActive,' +
        ' isSystem: $isSystem,' +
        ' storeid: $storeid,' +
        ' createdby: $createdby,' +
        ' date: $date,' +
        '}';
  }

  Accounting copyWith({
    int? id,
    String? voucherUuid,
    String? vouchername,
    String? accountUuid,
    double? amount,
    int? status,
    int? isActive,
    int? isSystem,
    String? storeid,
    String? createdby,
    DateTime? date,
  }) {
    return Accounting(
      id: id ?? this.id,
      voucherUuid: voucherUuid ?? this.voucherUuid,
      vouchername: vouchername ?? this.vouchername,
      accountUuid: accountUuid ?? this.accountUuid,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      isActive: isActive ?? this.isActive,
      isSystem: isSystem ?? this.isSystem,
      storeid: storeid ?? this.storeid,
      createdby: createdby ?? this.createdby,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'voucherUuid': this.voucherUuid,
      'vouchername': this.vouchername,
      'accountUuid': this.accountUuid,
      'amount': this.amount,
      'status': this.status,
      'isActive': this.isActive,
      'isSystem': this.isSystem,
      'storeid': this.storeid,
      'createdby': this.createdby,
      'date': this.date,
    };
  }

  factory Accounting.fromMap(Map<String, dynamic> map) {
    return Accounting(
      id: map['id'] as int,
      voucherUuid: map['voucherUuid'] as String,
      vouchername: map['vouchername'] as String,
      accountUuid: map['accountUuid'] as String,
      amount: map['amount'] as double,
      status: map['status'] as int,
      isActive: map['isActive'] as int,
      isSystem: map['isSystem'] as int,
      storeid: map['storeid'] as String,
      createdby: map['createdby'] as String,
      date: map['date'] as DateTime,
    );
  }

//</editor-fold>
}