

class CategoryModel {
  int id;
  String name;
  int status;
  String createdby;
  int is_active;
  String storeid;
  String busid;

//<editor-fold desc="Data Methods">
  CategoryModel({
    required this.id,
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
          id == other.id &&
          name == other.name &&
          status == other.status &&
          createdby == other.createdby &&
          is_active == other.is_active &&
          storeid == other.storeid &&
          busid == other.busid);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      status.hashCode ^
      createdby.hashCode ^
      is_active.hashCode ^
      storeid.hashCode ^
      busid.hashCode;

  @override
  String toString() {
    return 'CategoryModel{' +
        ' id: $id,' +
        ' name: $name,' +
        ' status: $status,' +
        ' createdby: $createdby,' +
        ' is_active: $is_active,' +
        ' storeid: $storeid,' +
        ' busid: $busid,' +
        '}';
  }

  CategoryModel copyWith({
    int? id,
    String? name,
    int? status,
    String? createdby,
    int? is_active,
    String? storeid,
    String? busid,
  }) {
    return CategoryModel(
      id: id ?? this.id,
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
      id: map['id'] as int,
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