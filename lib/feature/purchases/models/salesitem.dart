
class PurchaseItem{
  String name;
  String id;
  String uuid;
  double purchaseprice;
  int quantity;

//<editor-fold desc="Data Methods">
  PurchaseItem({
    required this.name,
    required this.id,
    required this.uuid,
    required this.purchaseprice,
    required this.quantity,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          id == other.id &&
          uuid == other.uuid &&
          purchaseprice == other.purchaseprice &&
          quantity == other.quantity);

  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      uuid.hashCode ^
      purchaseprice.hashCode ^
      quantity.hashCode;

  @override
  String toString() {
    return 'SalesItem{' +
        ' name: $name,' +
        ' id: $id,' +
        ' uuid: $uuid,' +
        ' salesprice: $purchaseprice,' +
        ' quantity: $quantity,' +
        '}';
  }

  PurchaseItem copyWith({
    String? name,
    String? id,
    String? uuid,
    double? salesprice,
    int? quantity,
  }) {
    return PurchaseItem(
      name: name ?? this.name,
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      purchaseprice: salesprice ?? this.purchaseprice,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'uuid': uuid,
      'salesprice': purchaseprice,
      'quantity': quantity,
      'amount': quantity*purchaseprice
    };
  }

  factory PurchaseItem.fromMap(Map<String, dynamic> map) {
    return PurchaseItem(
      name: map['name'] as String,
      id: map['id'] as String,
      uuid: map['uuid'] as String,
      purchaseprice: map['salesprice'] as double,
      quantity: map['quantity'] as int,
    );
  }

//</editor-fold>
}