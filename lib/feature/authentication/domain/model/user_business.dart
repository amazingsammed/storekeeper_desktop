
class UserBusiness{
  String userid;
  String busid;
  int status;

//<editor-fold desc="Data Methods">
  UserBusiness({
    required this.userid,
    required this.busid,
    required this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserBusiness &&
          runtimeType == other.runtimeType &&
          userid == other.userid &&
          busid == other.busid &&
          status == other.status);

  @override
  int get hashCode => userid.hashCode ^ busid.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'UserBusiness{' +
        ' userid: $userid,' +
        ' busid: $busid,' +
        ' status: $status,' +
        '}';
  }

  UserBusiness copyWith({
    String? userid,
    String? busid,
    int? status,
  }) {
    return UserBusiness(
      userid: userid ?? this.userid,
      busid: busid ?? this.busid,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'busid': busid,
      'status': status,
    };
  }

  factory UserBusiness.fromMap(Map<String, dynamic> map) {
    return UserBusiness(
      userid: map['userid'] as String,
      busid: map['busid'] as String,
      status: map['status'] as int,
    );
  }

//</editor-fold>
}