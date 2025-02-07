class Units{
  String id	;
  String name	;
  String qty;
  bool status;

//<editor-fold desc="Data Methods">
  Units({
    required this.id,
    required this.name,
    required this.qty,
    required this.status
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Units &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              qty == other.qty &&
              status == other.status
          );

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ qty.hashCode;

  @override
  String toString() {
    return 'Units{' + ' id: $id,' + ' name: $name,' + ' type: $qty,' + ' $status ''}';
  }

  Units copyWith({
    String? id,
    String? name,
    String? type,
    bool? status,
  }) {
    return Units(
      id: id ?? this.id,
      name: name ?? this.name,
      qty: type ?? this.qty,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'qty': this.qty,
      'status': this.status,
    };
  }

  factory Units.fromMap(Map<String, dynamic> map) {
    bool status = false;
    if(map['status'] == 1){
      status = true;
    }
    return Units(
      id: map['id'] as String,
      name: map['name'] as String,
      qty: map['qty'] as String,
      status: status,
    );
  }

  factory Units.empty() {
    return Units(id: '', name: '', qty: '', status: false);
  }


//</editor-fold>
}