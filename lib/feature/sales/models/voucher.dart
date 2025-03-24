class Voucher {
  final int id;
  final String uuid;
  final DateTime date;
  final int voucherType;
  final String narration;
  final String partyName;
  final int isInvoice;
  final int isAccountingVoucher;
  final int isInventoryVoucher;
  final int isOrderVoucher;
  final String createdby;
  final String storeid;
  final int status;
  final int isActive;

//<editor-fold desc="Data Methods">
  const Voucher({
    required this.id,
    required this.uuid,
    required this.date,
    required this.voucherType,
    required this.narration,
    required this.partyName,
    required this.isInvoice,
    required this.isAccountingVoucher,
    required this.isInventoryVoucher,
    required this.isOrderVoucher,
    required this.createdby,
    required this.storeid,
    required this.status,
    required this.isActive,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Voucher &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          uuid == other.uuid &&
          date == other.date &&
          voucherType == other.voucherType &&
          narration == other.narration &&
          partyName == other.partyName &&
          isInvoice == other.isInvoice &&
          isAccountingVoucher == other.isAccountingVoucher &&
          isInventoryVoucher == other.isInventoryVoucher &&
          isOrderVoucher == other.isOrderVoucher &&
          createdby == other.createdby &&
          storeid == other.storeid &&
          status == other.status &&
          isActive == other.isActive);

  @override
  int get hashCode =>
      id.hashCode ^
      uuid.hashCode ^
      date.hashCode ^
      voucherType.hashCode ^
      narration.hashCode ^
      partyName.hashCode ^
      isInvoice.hashCode ^
      isAccountingVoucher.hashCode ^
      isInventoryVoucher.hashCode ^
      isOrderVoucher.hashCode ^
      createdby.hashCode ^
      storeid.hashCode ^
      status.hashCode ^
      isActive.hashCode;

  @override
  String toString() {
    return 'Voucher{' +
        ' id: $id,' +
        ' uuid: $uuid,' +
        ' date: $date,' +
        ' voucherType: $voucherType,' +
        ' narration: $narration,' +
        ' partyName: $partyName,' +
        ' isInvoice: $isInvoice,' +
        ' isAccountingVoucher: $isAccountingVoucher,' +
        ' isInventoryVoucher: $isInventoryVoucher,' +
        ' isOrderVoucher: $isOrderVoucher,' +
        ' createdby: $createdby,' +
        ' storeid: $storeid,' +
        ' status: $status,' +
        ' isActive: $isActive,' +
        '}';
  }

  Voucher copyWith({
    int? id,
    String? uuid,
    DateTime? date,
    int? voucherType,
    String? narration,
    String? partyName,
    int? isInvoice,
    int? isAccountingVoucher,
    int? isInventoryVoucher,
    int? isOrderVoucher,
    String? createdby,
    String? storeid,
    int? status,
    int? isActive,
  }) {
    return Voucher(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      date: date ?? this.date,
      voucherType: voucherType ?? this.voucherType,
      narration: narration ?? this.narration,
      partyName: partyName ?? this.partyName,
      isInvoice: isInvoice ?? this.isInvoice,
      isAccountingVoucher: isAccountingVoucher ?? this.isAccountingVoucher,
      isInventoryVoucher: isInventoryVoucher ?? this.isInventoryVoucher,
      isOrderVoucher: isOrderVoucher ?? this.isOrderVoucher,
      createdby: createdby ?? this.createdby,
      storeid: storeid ?? this.storeid,
      status: status ?? this.status,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'uuid': this.uuid,
      'date': this.date,
      'voucherType': this.voucherType,
      'narration': this.narration,
      'partyName': this.partyName,
      'isInvoice': this.isInvoice,
      'isAccountingVoucher': this.isAccountingVoucher,
      'isInventoryVoucher': this.isInventoryVoucher,
      'isOrderVoucher': this.isOrderVoucher,
      'createdby': this.createdby,
      'storeid': this.storeid,
      'status': this.status,
      'isActive': this.isActive,
    };
  }

  factory Voucher.fromMap(Map<String, dynamic> map) {
    return Voucher(
      id: map['id'] as int,
      uuid: map['uuid'] as String,
      date: map['date'] as DateTime,
      voucherType: map['voucherType'] as int,
      narration: map['narration'] as String,
      partyName: map['partyName'] as String,
      isInvoice: map['isInvoice'] as int,
      isAccountingVoucher: map['isAccountingVoucher'] as int,
      isInventoryVoucher: map['isInventoryVoucher'] as int,
      isOrderVoucher: map['isOrderVoucher'] as int,
      createdby: map['createdby'] as String,
      storeid: map['storeid'] as String,
      status: map['status'] as int,
      isActive: map['isActive'] as int,
    );
  }

//</editor-fold>
}
