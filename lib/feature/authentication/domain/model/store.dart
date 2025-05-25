
class Store{
  String name;
  String contact;
  String storeid;
  String busid;
  String location;
  String manager;
  String createdby;

//<editor-fold desc="Data Methods">
  Store({
    required this.name,
    required this.contact,
    required this.storeid,
    required this.busid,
    required this.location,
    required this.manager,
    required this.createdby,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Store &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          contact == other.contact &&
          storeid == other.storeid &&
          busid == other.busid &&
          location == other.location &&
          manager == other.manager &&
          createdby == other.createdby);

  @override
  int get hashCode =>
      name.hashCode ^
      contact.hashCode ^
      storeid.hashCode ^
      busid.hashCode ^
      location.hashCode ^
      manager.hashCode ^
      createdby.hashCode;

  @override
  String toString() {
    return 'Store{' +
        ' name: $name,' +
        ' contact: $contact,' +
        ' storeid: $storeid,' +
        ' busid: $busid,' +
        ' location: $location,' +
        ' manager: $manager,' +
        ' createdby: $createdby,' +
        '}';
  }

  Store copyWith({
    String? name,
    String? contact,
    String? storeid,
    String? busid,
    String? location,
    String? manager,
    String? createdby,
  }) {
    return Store(
      name: name ?? this.name,
      contact: contact ?? this.contact,
      storeid: storeid ?? this.storeid,
      busid: busid ?? this.busid,
      location: location ?? this.location,
      manager: manager ?? this.manager,
      createdby: createdby ?? this.createdby,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'contact': this.contact,
      'storeid': this.storeid,
      'busid': this.busid,
      'location': this.location,
      'manager': this.manager,
      'createdby': this.createdby,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      name: map['name'] as String,
      contact: map['contact'] as String,
      storeid: map['storeid'] as String,
      busid: map['busid'] as String,
      location: map['location'] as String,
      manager: map['manager'] as String,
      createdby: map['createdby'] as String,
    );
  }

//</editor-fold>
}