


import 'package:get/get.dart';

import '../../../shared/ui/snackbars.dart';
import '../data/implementation/voucher_implementation.dart';
import '../data/voucher_database_repository.dart';
import '../models/voucher.dart';

class VoucherController extends GetxController{
  final VoucherRepository voucherRepository= VoucherImplementation();
  var allVouchers = <Voucher>[].obs;
  var loading = false.obs;


  Future<void> saveVoucher(Voucher data) async {

      loading.value = true;
      final results = await voucherRepository.getAllVouchers();
      results.fold((failure) {
        loading.value = false;
        showErrorSnackbar(message: failure.message);
      }, (exists) {
        allVouchers.value = exists;
        loading.value = false;
      });

  }

}