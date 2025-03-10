import 'dart:convert';
/// id : 1
/// uuid : "324541bc-3da6-4cbd-ace9-2c67d4214814"
/// date : "2024-10-30"
/// voucher_type : 14
/// voucher_number : ""
/// reference_number : ""
/// reference_date : "2024-09-09"
/// narration : "Stock of Infinix zero Ultra"
/// party_name : "Opening Stock"
/// place_of_supply : "home"
/// is_invoice : 0
/// is_accounting_voucher : 1
/// is_inventory_voucher : 1
/// is_order_voucher : 0
/// createdby : "5b86987b-e805-4986-b710-44d998f34d24"
/// storeid : "3ef250d5-704c-437e-912f-a2d4fe3736a8"
/// status : 1
/// is_active : 1

Voucher voucherFromJson(String str) => Voucher.fromJson(json.decode(str));
String voucherToJson(Voucher data) => json.encode(data.toJson());
class Voucher {
  Voucher({
      num? id, 
      String? uuid, 
      String? date, 
      num? voucherType, 
      String? voucherNumber, 
      String? referenceNumber, 
      String? referenceDate, 
      String? narration, 
      String? partyName, 
      String? placeOfSupply, 
      num? isInvoice, 
      num? isAccountingVoucher, 
      num? isInventoryVoucher, 
      num? isOrderVoucher, 
      String? createdby, 
      String? storeid, 
      num? status, 
      num? isActive,}){
    _id = id;
    _uuid = uuid;
    _date = date;
    _voucherType = voucherType;
    _voucherNumber = voucherNumber;
    _referenceNumber = referenceNumber;
    _referenceDate = referenceDate;
    _narration = narration;
    _partyName = partyName;
    _placeOfSupply = placeOfSupply;
    _isInvoice = isInvoice;
    _isAccountingVoucher = isAccountingVoucher;
    _isInventoryVoucher = isInventoryVoucher;
    _isOrderVoucher = isOrderVoucher;
    _createdby = createdby;
    _storeid = storeid;
    _status = status;
    _isActive = isActive;
}

  Voucher.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _date = json['date'];
    _voucherType = json['voucher_type'];
    _voucherNumber = json['voucher_number'];
    _referenceNumber = json['reference_number'];
    _referenceDate = json['reference_date'];
    _narration = json['narration'];
    _partyName = json['party_name'];
    _placeOfSupply = json['place_of_supply'];
    _isInvoice = json['is_invoice'];
    _isAccountingVoucher = json['is_accounting_voucher'];
    _isInventoryVoucher = json['is_inventory_voucher'];
    _isOrderVoucher = json['is_order_voucher'];
    _createdby = json['createdby'];
    _storeid = json['storeid'];
    _status = json['status'];
    _isActive = json['is_active'];
  }
  num? _id;
  String? _uuid;
  String? _date;
  num? _voucherType;
  String? _voucherNumber;
  String? _referenceNumber;
  String? _referenceDate;
  String? _narration;
  String? _partyName;
  String? _placeOfSupply;
  num? _isInvoice;
  num? _isAccountingVoucher;
  num? _isInventoryVoucher;
  num? _isOrderVoucher;
  String? _createdby;
  String? _storeid;
  num? _status;
  num? _isActive;
Voucher copyWith({  num? id,
  String? uuid,
  String? date,
  num? voucherType,
  String? voucherNumber,
  String? referenceNumber,
  String? referenceDate,
  String? narration,
  String? partyName,
  String? placeOfSupply,
  num? isInvoice,
  num? isAccountingVoucher,
  num? isInventoryVoucher,
  num? isOrderVoucher,
  String? createdby,
  String? storeid,
  num? status,
  num? isActive,
}) => Voucher(  id: id ?? _id,
  uuid: uuid ?? _uuid,
  date: date ?? _date,
  voucherType: voucherType ?? _voucherType,
  voucherNumber: voucherNumber ?? _voucherNumber,
  referenceNumber: referenceNumber ?? _referenceNumber,
  referenceDate: referenceDate ?? _referenceDate,
  narration: narration ?? _narration,
  partyName: partyName ?? _partyName,
  placeOfSupply: placeOfSupply ?? _placeOfSupply,
  isInvoice: isInvoice ?? _isInvoice,
  isAccountingVoucher: isAccountingVoucher ?? _isAccountingVoucher,
  isInventoryVoucher: isInventoryVoucher ?? _isInventoryVoucher,
  isOrderVoucher: isOrderVoucher ?? _isOrderVoucher,
  createdby: createdby ?? _createdby,
  storeid: storeid ?? _storeid,
  status: status ?? _status,
  isActive: isActive ?? _isActive,
);
  num? get id => _id;
  String? get uuid => _uuid;
  String? get date => _date;
  num? get voucherType => _voucherType;
  String? get voucherNumber => _voucherNumber;
  String? get referenceNumber => _referenceNumber;
  String? get referenceDate => _referenceDate;
  String? get narration => _narration;
  String? get partyName => _partyName;
  String? get placeOfSupply => _placeOfSupply;
  num? get isInvoice => _isInvoice;
  num? get isAccountingVoucher => _isAccountingVoucher;
  num? get isInventoryVoucher => _isInventoryVoucher;
  num? get isOrderVoucher => _isOrderVoucher;
  String? get createdby => _createdby;
  String? get storeid => _storeid;
  num? get status => _status;
  num? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['date'] = _date;
    map['voucher_type'] = _voucherType;
    map['voucher_number'] = _voucherNumber;
    map['reference_number'] = _referenceNumber;
    map['reference_date'] = _referenceDate;
    map['narration'] = _narration;
    map['party_name'] = _partyName;
    map['place_of_supply'] = _placeOfSupply;
    map['is_invoice'] = _isInvoice;
    map['is_accounting_voucher'] = _isAccountingVoucher;
    map['is_inventory_voucher'] = _isInventoryVoucher;
    map['is_order_voucher'] = _isOrderVoucher;
    map['createdby'] = _createdby;
    map['storeid'] = _storeid;
    map['status'] = _status;
    map['is_active'] = _isActive;
    return map;
  }

}