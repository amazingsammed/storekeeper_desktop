

class CategoryModel {
  int id;
  String name;
  int status;
  String createdby;

//<editor-fold desc="Data Methods">
  CategoryModel({
    required this.id,
    required this.name,
    required this.status,
    required this.createdby,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          status == other.status &&
          createdby == other.createdby);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ status.hashCode ^ createdby.hashCode;

  @override
  String toString() {
    return 'CategoryModel{' +
        ' id: $id,' +
        ' name: $name,' +
        ' status: $status,' +
        ' createdby: $createdby,' +
        '}';
  }

  CategoryModel copyWith({
    int? id,
    String? name,
    int? status,
    String? createdby,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      createdby: createdby ?? this.createdby,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'status': this.status,
      'createdby': this.createdby,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as int,
      createdby: map['createdby'] as String,
    );
  }

//</editor-fold>
}