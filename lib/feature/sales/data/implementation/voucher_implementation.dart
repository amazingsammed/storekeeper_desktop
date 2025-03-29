

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'package:storekepper_desktop/feature/sales/data/voucher_database_repository.dart';
import 'package:storekepper_desktop/feature/sales/models/voucher.dart';
import 'package:storekepper_desktop/shared/error/failure.dart';

import '../../../../shared/network/network.dart';
import '../../../items/data/local/item_localdb.dart';

class VoucherImplementation implements VoucherRepository{
  final ItemLocalDatabase localDatabase = ItemLocalDatabase();
  final NetworkInfo networkInfo = NetworkInfoImpl();
  final AuthController authController = Get.find();

  @override
  Future<Either<Failure, bool>> addVoucher({required Map<String, dynamic> data}) {
    // TODO: implement addVoucher
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Voucher>>> getAllVouchers() async {
    var data = <Voucher>[];
    try {
      if (await networkInfo.hasInternet()) {
    data= await localDatabase.getAllVoucher(store: authController.myStore);
    } else {
    data=  await localDatabase.getAllVoucher(store: authController.myStore);
    }

    return Right(data);
    } catch (error) {
    return Left(Failure(error.toString()));
    }
  }


}