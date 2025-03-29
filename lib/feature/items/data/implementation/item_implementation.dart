import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'package:storekepper_desktop/feature/items/data/remote/item_remotedb.dart';
import 'package:storekepper_desktop/feature/items/domain/models/category.dart';
import 'package:storekepper_desktop/feature/items/domain/models/group.dart';
import 'package:storekepper_desktop/feature/items/domain/models/item.dart';
import 'package:storekepper_desktop/feature/items/domain/models/units.dart';
import 'package:storekepper_desktop/feature/items/domain/repository/item_repository.dart';
import 'package:storekepper_desktop/shared/error/failure.dart';

import '../../../../shared/network/network.dart';
import '../local/item_localdb.dart';

class ItemImplementation implements ItemRepository {
  final ItemLocalDatabase localDatabase = ItemLocalDatabase();
  final ItemRemoteDatabase remoteDatabase=ItemRemoteDatabase();
  final NetworkInfo networkInfo = NetworkInfoImpl();
  final AuthController authController = Get.find();

  @override
  Future<Either<Failure, bool>> createSingleCategory({required CategoryModel data})async { try {
    if (await networkInfo.hasInternet()) {
  await localDatabase.addCategory(data: data.toMap());
  } else {
  await localDatabase.addCategory(data: data.toMap());
  }

    return const Right(true);
    } catch (error) {
    return Left(Failure(error.toString()));
    }
  }



  @override
  Future<Either<Failure, bool>> createSingleItem({required Item data}) async {
    try {
      if (await networkInfo.hasInternet()) {
        await localDatabase.addItem(data: data.toMap());
      } else {
        await localDatabase.addItem(data: data.toMap());
      }

      return Right(true);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createSingleUnit({required Units data})async {
    try {
      if (await networkInfo.hasInternet()) {
    await localDatabase.addUnit(data: data.toMap());
    } else {
    await localDatabase.addUnit(data: data.toMap());
    }

    return Right(true);
    } catch (error) {
    return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategory()async {
    var data = <CategoryModel>[];
    try {
      if (await networkInfo.hasInternet()) {
    data= await localDatabase.getAllCategory(store: authController.myStore);
    } else {
        data=  await localDatabase.getAllCategory(store: authController.myStore);
    }

    return Right(data);
    } catch (error) {
    return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Groups>>> getAllGroups() async {
    var data = <Groups>[];
    try {
      if (await networkInfo.hasInternet()) {
    data= await localDatabase.getAllGroups(store: authController.myStore);
    } else {
    data=  await localDatabase.getAllGroups(store: authController.myStore);
    }

    return Right(data);
    } catch (error) {
    return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Item>>> getAllItems({String? storeid,String? busid}) async {
    var data = <Item>[];
    try {
      if (await networkInfo.hasInternet()) {

    data= await remoteDatabase.getAllItems(store: authController.myStore);
    } else {
    data=  await localDatabase.getAllItems(store: authController.myStore);
    }

    return Right(data);
    } catch (error) {
      print(error);
    return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Units>>> getAllUnits() async {
    var data = <Units>[];
    try {
      if (await networkInfo.hasInternet()) {
    data= await localDatabase.getAllUnits(store: authController.myStore);
    } else {
    data=  await localDatabase.getAllUnits(store: authController.myStore);
    }

    return Right(data);
    } catch (error) {
    return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createSingleGroup({required Groups data}) async {
    try {
      if (await networkInfo.hasInternet()) {
    await localDatabase.addGroup(data: data.toMap());
    } else {
    await localDatabase.addGroup(data: data.toMap());
    }

    return Right(true);
    } catch (error) {
    return Left(Failure(error.toString()));
    }
  }
}
