

import 'package:dartz/dartz.dart';
import 'package:storekepper_desktop/feature/sales/models/voucher.dart';

import '../../../shared/error/failure.dart';

abstract class VoucherRepository{
  Future<Either<Failure,List<Voucher>>> getAllVouchers();
  Future<Either<Failure,bool>> addVoucher({required Map<String, dynamic> data}) ;
}