

class Category {
  String name;
  bool status;
  String createdby;
  String date;

//<editor-fold desc="Data Methods">
  Category({
    required this.name,
    required this.status,
    required this.createdby,
    required this.date,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          status == other.status &&
          createdby == other.createdby &&
          date == other.date);

  @override
  int get hashCode =>
      name.hashCode ^ status.hashCode ^ createdby.hashCode ^ date.hashCode;

  @override
  String toString() {
    return 'Category{' +
        ' name: $name,' +
        ' status: $status,' +
        ' createdby: $createdby,' +
        ' date: $date,' +
        '}';
  }

  Category copyWith({
    String? name,
    bool? status,
    String? createdby,
    String? date,
  }) {
    return Category(
      name: name ?? this.name,
      status: status ?? this.status,
      createdby: createdby ?? this.createdby,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'status': this.status,
      'createdby': this.createdby,
      'date': this.date,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] as String,
      status: map['status'] as bool,
      createdby: map['createdby'] as String,
      date: map['date'] as String,
    );
  }

//</editor-fold>
}