

class ChatofAccounts{
  String uuid;
  int code;
  String name;
  String group;
  double opening_bal;
  String description;
  String storeid;
  String createdby;
  DateTime date;
  int status;

//<editor-fold desc="Data Methods">
  ChatofAccounts({
    required this.uuid,
    required this.code,
    required this.name,
    required this.group,
    required this.opening_bal,
    required this.description,
    required this.storeid,
    required this.createdby,
    required this.date,
    required this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatofAccounts &&
          runtimeType == other.runtimeType &&
          uuid == other.uuid &&
          code == other.code &&
          name == other.name &&
          group == other.group &&
          opening_bal == other.opening_bal &&
          description == other.description &&
          storeid == other.storeid &&
          createdby == other.createdby &&
          date == other.date &&
          status == other.status);

  @override
  int get hashCode =>
      uuid.hashCode ^
      code.hashCode ^
      name.hashCode ^
      group.hashCode ^
      opening_bal.hashCode ^
      description.hashCode ^
      storeid.hashCode ^
      createdby.hashCode ^
      date.hashCode ^
      status.hashCode;

  @override
  String toString() {
    return 'ChatofAccounts{' +
        ' uuid: $uuid,' +
        ' code: $code,' +
        ' name: $name,' +
        ' group: $group,' +
        ' opening_bal: $opening_bal,' +
        ' description: $description,' +
        ' storeid: $storeid,' +
        ' createdby: $createdby,' +
        ' date: $date,' +
        ' status: $status,' +
        '}';
  }

  ChatofAccounts copyWith({
    String? uuid,
    int? code,
    String? name,
    String? group,
    double? opening_bal,
    String? description,
    String? storeid,
    String? createdby,
    DateTime? date,
    int? status,
  }) {
    return ChatofAccounts(
      uuid: uuid ?? this.uuid,
      code: code ?? this.code,
      name: name ?? this.name,
      group: group ?? this.group,
      opening_bal: opening_bal ?? this.opening_bal,
      description: description ?? this.description,
      storeid: storeid ?? this.storeid,
      createdby: createdby ?? this.createdby,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'code': code,
      'name': name,
      'groupx': "group",
      'opening_bal': opening_bal,
      'description': description,
      'storeid': storeid,
      'createdby': createdby,
      'datex': date.toIso8601String(),
      'status': status,
    };
  }

  factory ChatofAccounts.fromMap(Map<String, dynamic> map) {
    return ChatofAccounts(
      uuid: map['uuid'] as String,
      code: map['code'] as int,
      name: map['name'] as String,
      group: map['group'] as String,
      opening_bal: map['opening_bal'] as double,
      description: map['description'] as String,
      storeid: map['storeid'] as String,
      createdby: map['createdby'] as String,
      date: map['date'] as DateTime,
      status: map['status'] as int,
    );
  }

//</editor-fold>
}