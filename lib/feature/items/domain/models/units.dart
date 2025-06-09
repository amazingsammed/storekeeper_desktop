class Units{
  int id	;
  String name	;
  int status;
  String storeid;
  String busid;
  String createdby;

//<editor-fold desc="Data Methods">
  Units({
    required this.id,
    required this.name,
    required this.status,
    required this.storeid,
    required this.busid,
    required this.createdby,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Units &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          status == other.status &&
          storeid == other.storeid &&
          busid == other.busid &&
          createdby == other.createdby);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      status.hashCode ^
      storeid.hashCode ^
      busid.hashCode ^
      createdby.hashCode;

  @override
  String toString() {
    return 'Units{' +
        ' id: $id,' +
        ' name: $name,' +
        ' status: $status,' +
        ' storeid: $storeid,' +
        ' busid: $busid,' +
        ' createdby: $createdby,' +
        '}';
  }

  Units copyWith({
    int? id,
    String? name,
    int? status,
    String? storeid,
    String? busid,
    String? createdby,
  }) {
    return Units(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      storeid: storeid ?? this.storeid,
      busid: busid ?? this.busid,
      createdby: createdby ?? this.createdby,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'status': status,
      'storeid': storeid,
      'busid': busid,
      'createdby': createdby,
    };
  }

  factory Units.fromMap(Map<String, dynamic> map) {
    return Units(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as int,
      storeid: map['storeid'] as String,
      busid: map['busid'] as String,
      createdby: map['createdby'] as String,
    );
  }

//</editor-fold>
}