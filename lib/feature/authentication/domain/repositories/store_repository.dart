import 'package:dartz/dartz.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/store.dart';
import '../../../../shared/error/failure.dart';

abstract class StoreRepository {
  Future<Either<Failure, Store>> retrieve(String userId);
  Future<Either<Failure, void>> save(Store store);
  Future<Either<Failure, void>> delete(String storeid);
  Future<Either<Failure, Store>> update(Store store);
}