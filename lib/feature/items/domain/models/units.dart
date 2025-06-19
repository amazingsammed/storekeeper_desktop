class UnitModel{
  String uuid	;
  String name	;
  int status;
  String storeid;
  String busid;
  String createdby;

//<editor-fold desc="Data Methods">
  UnitModel({
    required this.uuid,
    required this.name,
    required this.status,
    required this.storeid,
    required this.busid,
    required this.createdby,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitModel &&
          runtimeType == other.runtimeType &&
          uuid == other.uuid &&
          name == other.name &&
          status == other.status &&
          storeid == other.storeid &&
          busid == other.busid &&
          createdby == other.createdby);

  @override
  int get hashCode =>
      uuid.hashCode ^
      name.hashCode ^
      status.hashCode ^
      storeid.hashCode ^
      busid.hashCode ^
      createdby.hashCode;

  @override
  String toString() {
    return 'UnitModel{' +
        ' uuid: $uuid,' +
        ' name: $name,' +
        ' status: $status,' +
        ' storeid: $storeid,' +
        ' busid: $busid,' +
        ' createdby: $createdby,' +
        '}';
  }

  UnitModel copyWith({
    String? uuid,
    String? name,
    int? status,
    String? storeid,
    String? busid,
    String? createdby,
  }) {
    return UnitModel(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      status: status ?? this.status,
      storeid: storeid ?? this.storeid,
      busid: busid ?? this.busid,
      createdby: createdby ?? this.createdby,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': this.uuid,
      'name': this.name,
      'status': this.status,
      'storeid': this.storeid,
      'busid': this.busid,
      'createdby': this.createdby,
    };
  }

  factory UnitModel.fromMap(Map<String, dynamic> map) {
    return UnitModel(
      uuid: map['uuid'] as String,
      name: map['name'] as String,
      status: map['status'] as int,
      storeid: map['storeid'] as String,
      busid: map['busid'] as String,
      createdby: map['createdby'] as String,
    );
  }

//</editor-fold>
}