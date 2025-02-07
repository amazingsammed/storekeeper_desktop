class Item {
  String item_id;
  double purchaseprice;
  String item_name;
  String unit_id;
  String store_id;
  String user_id;
  DateTime created_date;
  String image;
  bool is_featured;
  String barcode;
  double salesprice;
  String category;
  int quantity;
  int isModified;
  DateTime? modifiedDate;
  String? modifiedBy;
  int? warning_limit;

//<editor-fold desc="Data Methods">
  Item({
    required this.item_id,
    required this.purchaseprice,
    required this.item_name,
    required this.unit_id,
    required this.store_id,
    required this.user_id,
    required this.created_date,
    required this.image,
    required this.is_featured,
    required this.barcode,
    required this.salesprice,
    required this.category,
    this.quantity =1,
    required this.isModified,
    this.modifiedDate,
    this.modifiedBy,
    this.warning_limit,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Item &&
              runtimeType == other.runtimeType &&
              item_id == other.item_id &&
              purchaseprice == other.purchaseprice &&
              item_name == other.item_name &&
              unit_id == other.unit_id &&
              store_id == other.store_id &&
              user_id == other.user_id &&
              created_date == other.created_date &&
              image == other.image &&
              is_featured == other.is_featured &&
              barcode == other.barcode &&
              salesprice == other.salesprice &&
              category == other.category &&
              quantity == other.quantity &&
              isModified == other.isModified &&
              modifiedDate == other.modifiedDate &&
              modifiedBy == other.modifiedBy &&
              warning_limit == other.warning_limit);

  @override
  int get hashCode =>
      item_id.hashCode ^
      purchaseprice.hashCode ^
      item_name.hashCode ^
      unit_id.hashCode ^
      store_id.hashCode ^
      user_id.hashCode ^
      created_date.hashCode ^
      image.hashCode ^
      is_featured.hashCode ^
      barcode.hashCode ^
      salesprice.hashCode ^
      category.hashCode ^
      quantity.hashCode ^
      isModified.hashCode ^
      modifiedDate.hashCode ^
      modifiedBy.hashCode ^
      warning_limit.hashCode;

  @override
  String toString() {
    return 'Item{' +
        ' item_id: $item_id,' +
        ' purchaseprice: $purchaseprice,' +
        ' item_name: $item_name,' +
        ' unit_id: $unit_id,' +
        ' store_id: $store_id,' +
        ' user_id: $user_id,' +
        ' created_date: $created_date,' +
        ' image: $image,' +
        ' is_featured: $is_featured,' +
        ' barcode: $barcode,' +
        ' price: $salesprice,' +
        ' category: $category,' +
        ' quantity: $quantity,' +
        ' isModified: $isModified,' +
        ' modifiedDate: $modifiedDate,' +
        ' modifiedBy: $modifiedBy,' +
        ' warninglimit: $warning_limit,' +
        '}';
  }

  Item copyWith({
    String? item_id,
    double? purchaseprice,
    String? item_name,
    String? unit_id,
    String? store_id,
    String? user_id,
    DateTime? created_date,
    String? image,
    bool? is_featured,
    String? barcode,
    double? price,
    String? category,
    int? quantity,
    int? isModified,
    DateTime? modifiedDate,
    String? modifiedBy,
    int? warninglimit,
  }) {
    return Item(
      item_id: item_id ?? this.item_id,
      purchaseprice: purchaseprice ?? this.purchaseprice,
      item_name: item_name ?? this.item_name,
      unit_id: unit_id ?? this.unit_id,
      store_id: store_id ?? this.store_id,
      user_id: user_id ?? this.user_id,
      created_date: created_date ?? this.created_date,
      image: image ?? this.image,
      is_featured: is_featured ?? this.is_featured,
      barcode: barcode ?? this.barcode,
      salesprice: price ?? this.salesprice,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      isModified: isModified ?? this.isModified,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      warning_limit: warninglimit ?? this.warning_limit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item_id': this.item_id,
      'purchaseprice': this.purchaseprice,
      'item_name': this.item_name,
      'unit_id': this.unit_id,
      'store_id': this.store_id,
      'user_id': this.user_id,
      'created_date': this.created_date,
      'image': this.image,
      'is_featured': this.is_featured,
      'barcode': this.barcode,
      'price': this.salesprice,
      'category': this.category,
      'quantity': this.quantity,
      'isModified': this.isModified,
      'modifiedDate': this.modifiedDate,
      'modifiedBy': this.modifiedBy,
      'warning_limit': this.warning_limit,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      item_id: map['item_id'] as String,
      purchaseprice: double.parse(map['purchaseprice']),
      item_name: map['item_name'] as String,
      unit_id: map['unit_id'] as String,
      store_id: map['store_id'] as String,
      user_id: map['user_id'] as String,
      created_date: DateTime.parse(map['created_date']),
      image: (map['image']??"") as String,
      is_featured: bool.parse(map['is_featured']),
      barcode: (map['barcode']??"") as String,
      salesprice: double.parse(map['salesprice']),
      category: map['category'] as String,
      isModified: int.parse(map['isModified']),
      modifiedDate: DateTime.parse(map['modifiedDate']??"12121212") ,
      modifiedBy: (map['modifiedBy']??"") as String,
      warning_limit: int.parse(map['warning_limit']??'1'),
    );
  }

//</editor-fold>
}