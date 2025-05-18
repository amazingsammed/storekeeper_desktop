


class Product{
  String name;
  String id;
  String? image;
  String category_id;
  String unit_id;
  double purchase_price;
  double sales_price;
  int quantity;
  String? barcode;
  String createdby;
  DateTime createddate;
  String? modifiedby;
  DateTime? modifieddate;
  int min_order;
  int max_order;
  int reorder;
  int status;
  String item_id;
  String store_id;
  String business_id;
  int is_featured;
  int? warning_limit;

//<editor-fold desc="Data Methods">
  Product({
    required this.name,
    required this.id,
    this.image,
    required this.category_id,
    required this.unit_id,
    required this.purchase_price,
    required this.sales_price,
    required this.quantity,
    this.barcode,
    required this.createdby,
    required this.createddate,
    this.modifiedby,
    this.modifieddate,
    required this.min_order,
    required this.max_order,
    required this.reorder,
    required this.status,
    required this.item_id,
    required this.store_id,
    required this.business_id,
    required this.is_featured,
    this.warning_limit,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          id == other.id &&
          image == other.image &&
          category_id == other.category_id &&
          unit_id == other.unit_id &&
          purchase_price == other.purchase_price &&
          sales_price == other.sales_price &&
          quantity == other.quantity &&
          barcode == other.barcode &&
          createdby == other.createdby &&
          createddate == other.createddate &&
          modifiedby == other.modifiedby &&
          modifieddate == other.modifieddate &&
          min_order == other.min_order &&
          max_order == other.max_order &&
          reorder == other.reorder &&
          status == other.status &&
          item_id == other.item_id &&
          store_id == other.store_id &&
          business_id == other.business_id &&
          is_featured == other.is_featured &&
          warning_limit == other.warning_limit);

  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      image.hashCode ^
      category_id.hashCode ^
      unit_id.hashCode ^
      purchase_price.hashCode ^
      sales_price.hashCode ^
      quantity.hashCode ^
      barcode.hashCode ^
      createdby.hashCode ^
      createddate.hashCode ^
      modifiedby.hashCode ^
      modifieddate.hashCode ^
      min_order.hashCode ^
      max_order.hashCode ^
      reorder.hashCode ^
      status.hashCode ^
      item_id.hashCode ^
      store_id.hashCode ^
      business_id.hashCode ^
      is_featured.hashCode ^
      warning_limit.hashCode;

  @override
  String toString() {
    return 'Product{' +
        ' name: $name,' +
        ' id: $id,' +
        ' image: $image,' +
        ' category_id: $category_id,' +
        ' unit_id: $unit_id,' +
        ' purchase_price: $purchase_price,' +
        ' sales_price: $sales_price,' +
        ' quantity: $quantity,' +
        ' barcode: $barcode,' +
        ' createdby: $createdby,' +
        ' createddate: $createddate,' +
        ' modifiedby: $modifiedby,' +
        ' modifieddate: $modifieddate,' +
        ' min_order: $min_order,' +
        ' max_order: $max_order,' +
        ' reorder: $reorder,' +
        ' status: $status,' +
        ' item_id: $item_id,' +
        ' store_id: $store_id,' +
        ' business_id: $business_id,' +
        ' is_featured: $is_featured,' +
        ' warning_limit: $warning_limit,' +
        '}';
  }

  Product copyWith({
    String? name,
    String? id,
    String? image,
    String? category_id,
    String? unit_id,
    double? purchase_price,
    double? sales_price,
    int? quantity,
    String? barcode,
    String? createdby,
    DateTime? createddate,
    String? modifiedby,
    DateTime? modifieddate,
    int? min_order,
    int? max_order,
    int? reorder,
    int? status,
    String? item_id,
    String? store_id,
    String? business_id,
    int? is_featured,
    int? warning_limit,
  }) {
    return Product(
      name: name ?? this.name,
      id: id ?? this.id,
      image: image ?? this.image,
      category_id: category_id ?? this.category_id,
      unit_id: unit_id ?? this.unit_id,
      purchase_price: purchase_price ?? this.purchase_price,
      sales_price: sales_price ?? this.sales_price,
      quantity: quantity ?? this.quantity,
      barcode: barcode ?? this.barcode,
      createdby: createdby ?? this.createdby,
      createddate: createddate ?? this.createddate,
      modifiedby: modifiedby ?? this.modifiedby,
      modifieddate: modifieddate ?? this.modifieddate,
      min_order: min_order ?? this.min_order,
      max_order: max_order ?? this.max_order,
      reorder: reorder ?? this.reorder,
      status: status ?? this.status,
      item_id: item_id ?? this.item_id,
      store_id: store_id ?? this.store_id,
      business_id: business_id ?? this.business_id,
      is_featured: is_featured ?? this.is_featured,
      warning_limit: warning_limit ?? this.warning_limit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'image': image,
      'category_id': category_id,
      'unit_id': unit_id,
      'purchase_price': purchase_price,
      'sales_price': sales_price,
      'quantity': quantity,
      'barcode': barcode,
      'createdby': createdby,
      'createddate': createddate,
      'modifiedby': modifiedby,
      'modifieddate': modifieddate,
      'min_order': min_order,
      'max_order': max_order,
      'reorder': reorder,
      'status': status,
      'item_id': item_id,
      'store_id': store_id,
      'business_id': business_id,
      'is_featured': is_featured,
      'warning_limit': warning_limit,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      id: map['id'] as String,
      image: map['image'] as String,
      category_id: map['category_id'] as String,
      unit_id: map['unit_id'] as String,
      purchase_price: map['purchase_price'] as double,
      sales_price: map['sales_price'] as double,
      quantity: map['quantity'] as int,
      barcode: map['barcode'] as String,
      createdby: map['createdby'] as String,
      createddate: map['createddate'] as DateTime,
      modifiedby: map['modifiedby'] as String,
      modifieddate: map['modifieddate'] as DateTime,
      min_order: map['min_order'] as int,
      max_order: map['max_order'] as int,
      reorder: map['reorder'] as int,
      status: map['status'] as int,
      item_id: map['item_id'] as String,
      store_id: map['store_id'] as String,
      business_id: map['business_id'] as String,
      is_featured: map['is_featured'] as int,
      warning_limit: map['warning_limit'] as int,
    );
  }

//</editor-fold>
}