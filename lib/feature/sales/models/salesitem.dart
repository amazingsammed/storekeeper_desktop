
class SalesItem{
  String name;
  String id;
  double salesprice;
  int quantity;

//<editor-fold desc="Data Methods">
  SalesItem({
    required this.name,
    required this.id,
    required this.salesprice,
    required this.quantity,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          id == other.id &&
          salesprice == other.salesprice &&
          quantity == other.quantity);

  @override
  int get hashCode =>
      name.hashCode ^ id.hashCode ^ salesprice.hashCode ^ quantity.hashCode;

  @override
  String toString() {
    return 'SalesItem{' +
        ' name: $name,' +
        ' id: $id,' +
        ' salesprice: $salesprice,' +
        ' quantity: $quantity,' +
        '}';
  }

  SalesItem copyWith({
    String? name,
    String? id,
    double? salesprice,
    int? quantity,
  }) {
    return SalesItem(
      name: name ?? this.name,
      id: id ?? this.id,
      salesprice: salesprice ?? this.salesprice,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'id': this.id,
      'salesprice': this.salesprice,
      'quantity': this.quantity,
    };
  }

  factory SalesItem.fromMap(Map<String, dynamic> map) {
    return SalesItem(
      name: map['name'] as String,
      id: map['id'] as String,
      salesprice: map['salesprice'] as double,
      quantity: map['quantity'] as int,
    );
  }

//</editor-fold>
}