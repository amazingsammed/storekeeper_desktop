
import 'package:storekepper_desktop/feature/items/domain/models/group.dart';

class Item {
  final int id;
  final String name;
  final String uuid;
  final String busid;
  final String unit_id;
  final String group_id;
  final int status;
  final String createdby;
  final String storeid;
  final int is_active;
  final double salesprice;
  final double purchaseprice;
  final int warninglimit;
  final int is_service;

//<editor-fold desc="Data Methods">
  const Item({
    required this.id,
    required this.name,
    required this.uuid,
    required this.busid,
    required this.unit_id,
    required this.group_id,
    required this.status,
    required this.createdby,
    required this.storeid,
    required this.is_active,
    required this.salesprice,
    required this.purchaseprice,
    required this.warninglimit,
    required this.is_service,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          uuid == other.uuid &&
          busid == other.busid &&
          unit_id == other.unit_id &&
          group_id == other.group_id &&
          status == other.status &&
          createdby == other.createdby &&
          storeid == other.storeid &&
          is_active == other.is_active &&
          salesprice == other.salesprice &&
          purchaseprice == other.purchaseprice &&
          warninglimit == other.warninglimit &&
          is_service == other.is_service);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      uuid.hashCode ^
      busid.hashCode ^
      unit_id.hashCode ^
      group_id.hashCode ^
      status.hashCode ^
      createdby.hashCode ^
      storeid.hashCode ^
      is_active.hashCode ^
      salesprice.hashCode ^
      purchaseprice.hashCode ^
      warninglimit.hashCode ^
      is_service.hashCode;

  @override
  String toString() {
    return 'Item{' +
        ' id: $id,' +
        ' name: $name,' +
        ' uuid: $uuid,' +
        ' busid: $busid,' +
        ' unit_id: $unit_id,' +
        ' group_id: $group_id,' +
        ' status: $status,' +
        ' createdby: $createdby,' +
        ' storeid: $storeid,' +
        ' is_active: $is_active,' +
        ' salesprice: $salesprice,' +
        ' purchaseprice: $purchaseprice,' +
        ' warninglimit: $warninglimit,' +
        ' is_service: $is_service,' +
        '}';
  }

  Item copyWith({
    int? id,
    String? name,
    String? uuid,
    String? busid,
    String? unit_id,
    String? group_id,
    int? status,
    String? createdby,
    String? storeid,
    int? is_active,
    double? salesprice,
    double? purchaseprice,
    int? warninglimit,
    int? is_service,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      uuid: uuid ?? this.uuid,
      busid: busid ?? this.busid,
      unit_id: unit_id ?? this.unit_id,
      group_id: group_id ?? this.group_id,
      status: status ?? this.status,
      createdby: createdby ?? this.createdby,
      storeid: storeid ?? this.storeid,
      is_active: is_active ?? this.is_active,
      salesprice: salesprice ?? this.salesprice,
      purchaseprice: purchaseprice ?? this.purchaseprice,
      warninglimit: warninglimit ?? this.warninglimit,
      is_service: is_service ?? this.is_service,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uuid': uuid,
      'busid': busid,
      'unit_id': unit_id,
      'group_id': group_id,
      'status': status,
      'createdby': createdby,
      'storeid': storeid,
      'is_active': is_active,
      'salesprice': salesprice,
      'purchaseprice': purchaseprice,
      'warninglimit': warninglimit,
      'is_service': is_service,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: 0,
      name: map['name'] as String,
      uuid: map['uuid'] as String,
      busid: map['busid'] as String,
      unit_id: map['unit_id'] as String,
      group_id: map['group_id'] as String,
      status: map['status'] as int,
      createdby: map['createdby'] as String,
      storeid: map['storeid'] as String,
      is_active: map['is_active'] as int,
      salesprice: double.parse(map['salesprice'].toString()),
      purchaseprice: double.parse(map['purchaseprice'].toString()),
      warninglimit: map['warninglimit'] as int,
      is_service: map['is_service'] as int,
    );
  }

//</editor-fold>
  String getGroup(List<GroupModel> value) {
    print(value);
    if(value.isEmpty) return 'loading..';
    try{

   return value.firstWhere((element)=>element.uuid==int.parse(group_id)).name;
    }catch(e){
      return "loading";
    }
  }
  String getStatus() {
    if(status==0)return 'inactive';
    return 'active';

  }

}
