

class UserStore{
  String userid;
  String storeid;
  String busid;
  int status;

//<editor-fold desc="Data Methods">
  UserStore({
    required this.userid,
    required this.storeid,
    required this.busid,
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
          status == other.status);

  @override
  int get hashCode =>
      userid.hashCode ^ storeid.hashCode ^ busid.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'UserStore{' +
        ' userid: $userid,' +
        ' storeid: $storeid,' +
        ' busid: $busid,' +
        ' status: $status,' +
        '}';
  }

  UserStore copyWith({
    String? userid,
    String? storeid,
    String? busid,
    int? status,
  }) {
    return UserStore(
      userid: userid ?? this.userid,
      storeid: storeid ?? this.storeid,
      busid: busid ?? this.busid,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': this.userid,
      'storeid': this.storeid,
      'busid': this.busid,
      'status': this.status,
    };
  }

  factory UserStore.fromMap(Map<String, dynamic> map) {
    return UserStore(
      userid: map['userid'] as String,
      storeid: map['storeid'] as String,
      busid: map['busid'] as String,
      status: map['status'] as int,
    );
  }

//</editor-fold>
}