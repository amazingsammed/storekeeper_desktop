

import 'package:dartz/dartz.dart';
import 'package:storekepper_desktop/feature/sales/data/voucher_database_repository.dart';
import 'package:storekepper_desktop/feature/sales/models/voucher.dart';
import 'package:storekepper_desktop/shared/error/failure.dart';

import '../../../../shared/network/network.dart';
import '../../../items/data/local/item_localdb.dart';

class VoucherImplementation implements VoucherRepository{
  final ItemLocalDatabase localDatabase = ItemLocalDatabase();
  final NetworkInfo networkInfo = NetworkInfoImpl();

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
    data= await localDatabase.getAllVoucher();
    } else {
    data=  await localDatabase.getAllVoucher();
    }

    return Right(data);
    } catch (error) {
    return Left(Failure(error.toString()));
    }
  }


}