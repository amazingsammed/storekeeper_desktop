class Units{
  int id	;
  String name	;
  int status;

//<editor-fold desc="Data Methods">
  Units({
    required this.id,
    required this.name,
    required this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Units &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          status == other.status);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'Units{' + ' id: $id,' + ' name: $name,' + ' status: $status,' + '}';
  }

  Units copyWith({
    int? id,
    String? name,
    int? status,
  }) {
    return Units(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'status': this.status,
    };
  }

  factory Units.fromMap(Map<String, dynamic> map) {
    return Units(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as int,
    );
  }

//</editor-fold>
}