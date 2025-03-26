

class Profile{
  String userid;
  String username;
  String email;
  String password;

//<editor-fold desc="Data Methods">
  Profile({
    required this.userid,
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          runtimeType == other.runtimeType &&
          userid == other.userid &&
          username == other.username &&
          email == other.email &&
          password == other.password);

  @override
  int get hashCode =>
      userid.hashCode ^ username.hashCode ^ email.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'Profile{' +
        ' userid: $userid,' +
        ' username: $username,' +
        ' email: $email,' +
        ' password: $password,' +
        '}';
  }

  Profile copyWith({
    String? userid,
    String? username,
    String? email,
    String? password,
  }) {
    return Profile(
      userid: userid ?? this.userid,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': this.userid,
      'username': this.username,
      'email': this.email,
      'password': this.password,
    };
  }
factory Profile.empty(){
    return Profile(userid: '', username: '', email: '', password: '');
}
  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      userid: map['userid'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}