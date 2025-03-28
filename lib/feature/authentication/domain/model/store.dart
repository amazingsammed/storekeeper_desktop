
class Store{
  String name;
  String contact;
  String owner;
  String storeid;
  String busid;
  String location;
  String manager;

//<editor-fold desc="Data Methods">
  Store({
    required this.name,
    required this.contact,
    required this.owner,
    required this.storeid,
    required this.busid,
    required this.location,
    required this.manager,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Store &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          contact == other.contact &&
          owner == other.owner &&
          storeid == other.storeid &&
          busid == other.busid &&
          location == other.location &&
          manager == other.manager);

  @override
  int get hashCode =>
      name.hashCode ^
      contact.hashCode ^
      owner.hashCode ^
      storeid.hashCode ^
      busid.hashCode ^
      location.hashCode ^
      manager.hashCode;

  @override
  String toString() {
    return 'Store{' +
        ' name: $name,' +
        ' contact: $contact,' +
        ' owner: $owner,' +
        ' storeid: $storeid,' +
        ' busid: $busid,' +
        ' location: $location,' +
        ' manager: $manager,' +
        '}';
  }

  Store copyWith({
    String? name,
    String? contact,
    String? owner,
    String? storeid,
    String? busid,
    String? location,
    String? manager,
  }) {
    return Store(
      name: name ?? this.name,
      contact: contact ?? this.contact,
      owner: owner ?? this.owner,
      storeid: storeid ?? this.storeid,
      busid: busid ?? this.busid,
      location: location ?? this.location,
      manager: manager ?? this.manager,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'contact': this.contact,
      'owner': this.owner,
      'storeid': this.storeid,
      'busid': this.busid,
      'location': this.location,
      'manager': this.manager,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      name: map['name'] as String,
      contact: map['contact'] as String,
      owner: map['owner'] as String,
      storeid: map['storeid'] as String,
      busid: map['busid'] as String,
      location: map['location'] as String,
      manager: map['manager'] as String,
    );
  }

//</editor-fold>
}