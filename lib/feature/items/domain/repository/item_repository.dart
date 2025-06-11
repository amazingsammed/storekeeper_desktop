

import 'package:dartz/dartz.dart';
import 'package:storekepper_desktop/feature/items/domain/models/group.dart';

import 'package:storekepper_desktop/shared/error/failure.dart';

import '../models/category.dart';
import '../models/item.dart';
import '../models/units.dart';

abstract class ItemRepository{
  Future<Either<Failure,List<Item>>> getAllItems();
  Future<Either<Failure,List<CategoryModel>>> getAllCategory();
  Future<Either<Failure,List<UnitModel>>> getAllUnits();
  Future<Either<Failure,List<GroupModel>>> getAllGroups();

  Future<Either<Failure,bool>> createSingleItem({required Item data});
  Future<Either<Failure,bool>> createSingleUnit({required UnitModel data});
  Future<Either<Failure,bool>> createSingleCategory({required CategoryModel data});
  Future<Either<Failure,bool>> createSingleGroup({required GroupModel data});

}