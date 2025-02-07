
class Groups{
  int id;
  String name;
  String category;

//<editor-fold desc="Data Methods">
  Groups({
    required this.id,
    required this.name,
    required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Groups &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          category == other.category);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ category.hashCode;

  @override
  String toString() {
    return 'Groups{' +
        ' id: $id,' +
        ' name: $name,' +
        ' category: $category,' +
        '}';
  }

  Groups copyWith({
    int? id,
    String? name,
    String? category,
  }) {
    return Groups(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'category': this.category,
    };
  }

  factory Groups.fromMap(Map<String, dynamic> map) {
    return Groups(
      id: map['id'] as int,
      name: map['name'] as String,
      category: map['category'] as String,
    );
  }

//</editor-fold>
}