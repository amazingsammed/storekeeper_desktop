

class Profile{
  String userid;
  String username;
  String email;
  String password;
  String type;

//<editor-fold desc="Data Methods">
  Profile({
    required this.userid,
    required this.username,
    required this.email,
    required this.password,
     this.type = "subsidiary",
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          runtimeType == other.runtimeType &&
          userid == other.userid &&
          username == other.username &&
          email == other.email &&
          password == other.password &&
          type == other.type);

  @override
  int get hashCode =>
      userid.hashCode ^
      username.hashCode ^
      email.hashCode ^
      password.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'Profile{' +
        ' userid: $userid,' +
        ' username: $username,' +
        ' email: $email,' +
        ' password: $password,' +
        ' type: $type,' +
        '}';
  }

  Profile copyWith({
    String? userid,
    String? username,
    String? email,
    String? password,
    String? type,
  }) {
    return Profile(
      userid: userid ?? this.userid,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'username': username,
      'email': email,
      'password': password,
      'type': type,
    };
  }
  factory Profile.empty(){
    return Profile(userid: '', username: '', email: '', password: '', type: '');
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      userid: map['userid'] as String,
      username: (map['username']??map['name']) as String,
      email: map['email'] as String,
      password: map['password'] as String,
      type: (map['type'] ?? 'subsidiary') as String,
    );
  }

//</editor-fold>
}