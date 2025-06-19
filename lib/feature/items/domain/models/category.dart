

class CategoryModel {
  String uuid;
  String name;
  int status;
  String createdby;
  int is_active;
  String storeid;
  String busid;

//<editor-fold desc="Data Methods">
  CategoryModel({
    required this.uuid,
    required this.name,
    required this.status,
    required this.createdby,
    required this.is_active,
    required this.storeid,
    required this.busid,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryModel &&
          runtimeType == other.runtimeType &&
          uuid == other.uuid &&
          name == other.name &&
          status == other.status &&
          createdby == other.createdby &&
          is_active == other.is_active &&
          storeid == other.storeid &&
          busid == other.busid);

  @override
  int get hashCode =>
      uuid.hashCode ^
      name.hashCode ^
      status.hashCode ^
      createdby.hashCode ^
      is_active.hashCode ^
      storeid.hashCode ^
      busid.hashCode;

  @override
  String toString() {
    return 'CategoryModel{' +
        ' uuid: $uuid,' +
        ' name: $name,' +
        ' status: $status,' +
        ' createdby: $createdby,' +
        ' is_active: $is_active,' +
        ' storeid: $storeid,' +
        ' busid: $busid,' +
        '}';
  }

  CategoryModel copyWith({
    String? uuid,
    String? name,
    int? status,
    String? createdby,
    int? is_active,
    String? storeid,
    String? busid,
  }) {
    return CategoryModel(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      status: status ?? this.status,
      createdby: createdby ?? this.createdby,
      is_active: is_active ?? this.is_active,
      storeid: storeid ?? this.storeid,
      busid: busid ?? this.busid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': this.uuid,
      'name': this.name,
      'status': this.status,
      'createdby': this.createdby,
      'is_active': this.is_active,
      'storeid': this.storeid,
      'busid': this.busid,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      uuid: map['uuid'] as String,
      name: map['name'] as String,
      status: map['status'] as int,
      createdby: map['createdby'] as String,
      is_active: map['is_active'] as int,
      storeid: map['storeid'] as String,
      busid: map['busid'] as String,
    );
  }

//</editor-fold>
}