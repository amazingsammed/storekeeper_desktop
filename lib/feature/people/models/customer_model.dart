


class CustomerModel{
  String name;
  String phone;
  String address;
  String coa_uuid;
  String createdby;
  String storeid;
  int status;

//<editor-fold desc="Data Methods">
  CustomerModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.coa_uuid,
    required this.createdby,
    required this.storeid,
    required this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          phone == other.phone &&
          address == other.address &&
          coa_uuid == other.coa_uuid &&
          createdby == other.createdby &&
          storeid == other.storeid &&
          status == other.status);

  @override
  int get hashCode =>
      name.hashCode ^
      phone.hashCode ^
      address.hashCode ^
      coa_uuid.hashCode ^
      createdby.hashCode ^
      storeid.hashCode ^
      status.hashCode;

  @override
  String toString() {
    return 'Customer{' +
        ' name: $name,' +
        ' phone: $phone,' +
        ' address: $address,' +
        ' coa_uuid: $coa_uuid,' +
        ' createdby: $createdby,' +
        ' storeid: $storeid,' +
        ' status: $status,' +
        '}';
  }

  CustomerModel copyWith({
    String? name,
    String? phone,
    String? address,
    String? coa_uuid,
    String? createdby,
    String? storeid,
    int? status,
  }) {
    return CustomerModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      coa_uuid: coa_uuid ?? this.coa_uuid,
      createdby: createdby ?? this.createdby,
      storeid: storeid ?? this.storeid,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'phone': this.phone,
      'address': this.address,
      'coa_uuid': this.coa_uuid,
      'createdby': this.createdby,
      'storeid': this.storeid,
      'status': this.status,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      name: map['name'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
      coa_uuid: map['coa_uuid'] as String,
      createdby: map['createdby'] as String,
      storeid: map['storeid'] as String,
      status: map['status'] as int,
    );
  }

//</editor-fold>
}