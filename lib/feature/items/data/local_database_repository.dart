

import 'package:storekepper_desktop/feature/authentication/domain/model/store.dart';

import '../../sales/models/voucher.dart';
import '../domain/models/category.dart';
import '../domain/models/group.dart';
import '../domain/models/item.dart';
import '../domain/models/units.dart';

abstract class ItemDatabaseRepository{
  Future<List<Item>> getAllItems({required Store store}) ;

  Future<List<Groups>> getAllGroups({required Store store});

  Future<List<Units>> getAllUnits({required Store store});

  Future<List<CategoryModel>> getAllCategory({ required Store store});
  Future<List<Voucher>> getAllVoucher({required Store store});

  Future<bool> addCategory({required Map<String, dynamic> data});

  Future<bool> addGroup({required Map<String, dynamic> data});

  Future<bool> addUnit({required Map<String, dynamic> data}) ;
  Future<bool> addItem({required Map<String, dynamic> data}) ;
  Future<bool> addVoucher({required Map<String, dynamic> data}) ;

}