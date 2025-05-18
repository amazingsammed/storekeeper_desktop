

class Business{
  String name;
  String owner;
  String type;
  String busid;
  String location;
  String contact;

//<editor-fold desc="Data Methods">
  Business({
    required this.name,
    required this.owner,
    required this.type,
    required this.busid,
    required this.location,
    required this.contact,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Business &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          owner == other.owner &&
          type == other.type &&
          busid == other.busid &&
          location == other.location &&
          contact == other.contact);

  @override
  int get hashCode =>
      name.hashCode ^
      owner.hashCode ^
      type.hashCode ^
      busid.hashCode ^
      location.hashCode ^
      contact.hashCode;

  @override
  String toString() {
    return 'Business{' +
        ' name: $name,' +
        ' owner: $owner,' +
        ' type: $type,' +
        ' busid: $busid,' +
        ' location: $location,' +
        ' contact: $contact,' +
        '}';
  }

  Business copyWith({
    String? name,
    String? owner,
    String? type,
    String? busid,
    String? location,
    String? contact,
  }) {
    return Business(
      name: name ?? this.name,
      owner: owner ?? this.owner,
      type: type ?? this.type,
      busid: busid ?? this.busid,
      location: location ?? this.location,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'owner': owner,
      'type': type,
      'busid': busid,
      'location': location,
      'contact': contact,
    };
  }

  factory Business.fromMap(Map<String, dynamic> map) {
    return Business(
      name: map['name'] as String,
      owner: map['owner'] as String,
      type: map['type'] as String,
      busid: map['busid'] as String,
      location: map['location'] as String,
      contact: map['contact'] as String,
    );
  }

//</editor-fold>
}