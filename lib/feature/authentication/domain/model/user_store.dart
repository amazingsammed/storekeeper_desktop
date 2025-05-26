

class UserStore{
  String userid;
  String storeid;
  String busid;
  String role;
  int status;

//<editor-fold desc="Data Methods">
  UserStore({
    required this.userid,
    required this.storeid,
    required this.busid,
    required this.role,
    required this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserStore &&
          runtimeType == other.runtimeType &&
          userid == other.userid &&
          storeid == other.storeid &&
          busid == other.busid &&
          role == other.role &&
          status == other.status);

  @override
  int get hashCode =>
      userid.hashCode ^
      storeid.hashCode ^
      busid.hashCode ^
      role.hashCode ^
      status.hashCode;

  @override
  String toString() {
    return 'UserStore{' +
        ' userid: $userid,' +
        ' storeid: $storeid,' +
        ' busid: $busid,' +
        ' role: $role,' +
        ' status: $status,' +
        '}';
  }

  UserStore copyWith({
    String? userid,
    String? storeid,
    String? busid,
    String? role,
    int? status,
  }) {
    return UserStore(
      userid: userid ?? this.userid,
      storeid: storeid ?? this.storeid,
      busid: busid ?? this.busid,
      role: role ?? this.role,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'storeid': storeid,
      'busid': busid,
      'role': role,
      'status': status,
    };
  }

  factory UserStore.fromMap(Map<String, dynamic> map) {
    return UserStore(
      userid: map['userid'] as String,
      storeid: map['storeid'] as String,
      busid: map['busid'] as String,
      role: map['role'] as String,
      status: map['status'] as int,
    );
  }

//</editor-fold>
}