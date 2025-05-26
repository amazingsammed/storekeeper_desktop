import 'package:get/get.dart';
import 'package:sqlbase/sqlbase.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'package:storekepper_desktop/feature/sales/models/voucher.dart';
import 'package:storekepper_desktop/feature/sqlbase_db.dart';
import 'package:storekepper_desktop/shared/ui/snackbars.dart';

import '../models/salesitem.dart';

class SalesController extends GetxController {
  AuthController authController = Get.find();
  var salesItem = <SalesItem>[].obs;
  var salesList = <Voucher>[].obs;

  var balance = 0.0.obs;
  var completed = false.obs;
  var loading = false.obs;

  double totalAmount() {
    double x = 0;
    for (var item in salesItem) {
      x = x + item.salesprice * item.quantity;
    }
    return x;
  }

  addSalesItem(SalesItem element) {
    if (salesItem.value.where((e) => e.uuid == element.uuid).isNotEmpty) {
      showErrorSnackbar(message: "Item already in list");
    } else {
      salesItem.add(element);
    }
  }

  removeSalesItem(SalesItem element) {
    salesItem.remove(salesItem.firstWhere((test) => test.uuid == element.uuid));
  }

  Future <void>getAllSales() async {
    loading.value = true;
    salesList.clear();
    SqlBaseResponse results = await mydb
        .table('voucher')
        .where('voucher_type', isEqualTo: 22)
        .where('storeid',isEqualTo: authController.selectedStore.storeid)
        .get();
    for (var element in results.data['data']) {
      salesList.add(Voucher.fromMap(element));
    }
    loading.value = false;
  }
}
