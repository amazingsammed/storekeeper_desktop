

import 'package:dartz/dartz.dart';

import 'package:storekepper_desktop/shared/error/failure.dart';

import '../models/category.dart';
import '../models/item.dart';
import '../models/units.dart';

abstract class ItemRepository{
  Future<Either<Failure,List<Item>>> getAllItems();
  Future<Either<Failure,List<Category>>> getAllCategory();
  Future<Either<Failure,List<Units>>> getAllUnits();
  Future<Either<Failure,List>> getAllGroups();

  Future<Either<Failure,bool>> createSingleItem({required Item data});
  Future<Either<Failure,bool>> createSingleUnit({required Units data});
  Future<Either<Failure,bool>> createSingleCategory({required Category data});
  Future<Either<Failure,bool>> createSingleGroup();

  createManyItem();
  createManyUnit();
  createManyCategory();
  createManyGroup();

}