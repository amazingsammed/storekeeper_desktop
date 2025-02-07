

class CategoryModel {
  String name;
  bool status;
  String createdby;
  String date;

//<editor-fold desc="Data Methods">
  CategoryModel({
    required this.name,
    required this.status,
    required this.createdby,
    required this.date,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryModel &&
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
    return 'CategoryModel{' +
        ' name: $name,' +
        ' status: $status,' +
        ' createdby: $createdby,' +
        ' date: $date,' +
        '}';
  }

  CategoryModel copyWith({
    String? name,
    bool? status,
    String? createdby,
    String? date,
  }) {
    return CategoryModel(
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

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] as String,
      status: map['status'] as bool,
      createdby: map['createdby'] as String,
      date: map['date'] as String,
    );
  }

//</editor-fold>
}