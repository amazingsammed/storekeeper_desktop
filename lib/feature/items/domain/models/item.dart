// To parse this JSON data, do
//
//     final item = itemFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Item> itemFromMap(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromMap(x)));

List itemToMap(List<Item> data) => List<dynamic>.from(data.map((x) => x.toMap()));

class Item {
  final int id;
  final String name;
  final String uuid;
  final String unitId;
  final String groupId;
  final int status;
  final String createdby;
  final String storeid;
  final DateTime createddate;
  final int isActive;
  final double salesprice;
  final double purchaseprice;
  final int warninglimit;
  final int isService;

  Item({
    required this.id,
    required this.name,
    required this.uuid,
    required this.unitId,
    required this.groupId,
    required this.status,
    required this.createdby,
    required this.storeid,
    required this.createddate,
    required this.isActive,
    required this.salesprice,
    required this.purchaseprice,
    required this.warninglimit,
    required this.isService,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    uuid: json["uuid"],
    unitId: json["unit_id"],
    groupId: json["group_id"],
    status: json["status"],
    createdby: json["createdby"],
    storeid: json["storeid"],
    createddate: DateTime.parse(json["createddate"]),
    isActive: json["is_active"],
    salesprice: json["salesprice"]?.toDouble(),
    purchaseprice: json["purchaseprice"]?.toDouble(),
    warninglimit: json["warninglimit"],
    isService: json["is_service"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "uuid": uuid,
    "unit_id": unitId,
    "group_id": groupId,
    "status": status,
    "createdby": createdby,
    "storeid": storeid,
    "createddate": createddate.toIso8601String(),
    "is_active": isActive,
    "salesprice": salesprice,
    "purchaseprice": purchaseprice,
    "warninglimit": warninglimit,
    "is_service": isService,
  };
}
