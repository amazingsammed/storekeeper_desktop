
class GroupModel{
  int id;
  String name;
  String category;
  String createdby;
  String storeid;
  int is_active;
  String busid;

//<editor-fold desc="Data Methods">
  GroupModel({
    required this.id,
    required this.name,
    required this.category,
    required this.createdby,
    required this.storeid,
    required this.is_active,
    required this.busid,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          category == other.category &&
          createdby == other.createdby &&
          storeid == other.storeid &&
          is_active == other.is_active &&
          busid == other.busid);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      category.hashCode ^
      createdby.hashCode ^
      storeid.hashCode ^
      is_active.hashCode ^
      busid.hashCode;

  @override
  String toString() {
    return 'Groups{' +
        ' id: $id,' +
        ' name: $name,' +
        ' category: $category,' +
        ' createdby: $createdby,' +
        ' storeid: $storeid,' +
        ' is_active: $is_active,' +
        ' busid: $busid,' +
        '}';
  }

  GroupModel copyWith({
    int? id,
    String? name,
    String? category,
    String? createdby,
    String? storeid,
    int? is_active,
    String? busid,
  }) {
    return GroupModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      createdby: createdby ?? this.createdby,
      storeid: storeid ?? this.storeid,
      is_active: is_active ?? this.is_active,
      busid: busid ?? this.busid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'createdby': createdby,
      'storeid': storeid,
      'is_active': is_active,
      'busid': busid,
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      id: 0,
      name: map['name'] as String,
      category: map['category'] as String,
      createdby: map['createdby'] as String,
      storeid: map['storeid'] as String,
      is_active: map['is_active'] as int,
      busid: map['busid'] as String,
    );
  }

//</editor-fold>
}