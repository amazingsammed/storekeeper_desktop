import 'package:get/get.dart';
import 'package:sqlbase/sqlbase.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'package:storekepper_desktop/feature/sales/models/voucher.dart';
import 'package:storekepper_desktop/feature/sqlbase_db.dart';
import 'package:storekepper_desktop/shared/ui/snackbars.dart';

import '../../sales/models/salesitem.dart';
import '../models/salesitem.dart';


class PurchasesController extends GetxController {
  AuthController authController = Get.find();
  var purchaseItem = <PurchaseItem>[].obs;
  var salesList = <Voucher>[].obs;

  var balance = 0.0.obs;
  var completed = false.obs;
  var loading = false.obs;

  double totalAmount() {
    double x = 0;
    for (var item in purchaseItem) {
      x = x + item.purchaseprice * item.quantity;
    }
    return x;
  }

  addPurchaseItem(PurchaseItem element) {
    if (purchaseItem.value.where((e) => e.uuid == element.uuid).isNotEmpty) {
      showErrorSnackbar(message: "Item already in list");
    } else {
      purchaseItem.add(element);
    }
  }

  removeSalesItem(PurchaseItem element) {
    purchaseItem.remove(purchaseItem.firstWhere((test) => test.uuid == element.uuid));
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
