import 'package:get/get.dart';
import 'package:sqlbase/sqlbase.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'package:storekepper_desktop/feature/people/models/customer_model.dart';
import 'package:storekepper_desktop/feature/people/models/supplier_model.dart';
import 'package:storekepper_desktop/shared/ui/snackbars.dart';

import '../models/customer_record.dart';

class PeopleController extends GetxController {
  AuthController authController = AuthController();
  final Sqlbase mySqldb = Sqlbase();
  var loading = false.obs;
  var customerList = <CustomerModel>[].obs;

  getAllCutomers() async {
    loading.value = true;
    try {
      SqlBaseResponse data = await mySqldb
          .table('customer',)
          .where('storeid', isEqualTo: authController.storeid)
          .get();
      customerList.clear();
      for (var element in data.data['data']) {
        customerList.add(CustomerModel.fromMap(element));
      }
      loading.value = false;
    } catch (e) {
      print(e.toString());
    } finally {
      loading.value = false;
    }
  }

  addCustomer({required CustomerRecord transaction}) async {
    SqlBaseResponse data = await mySqldb.transaction((batch) {
      batch.start();
      batch.add('customer', transaction.customer.toMap());
      batch.add('chart_of_account', transaction.accounts.toMap());
      return batch;
    });

    print(data.toString());

    return true;
  }

  addSupplier({required SupplierModel data}) {}

  Future<void> editCustomer({required CustomerModel customer}) async {
    SqlBaseResponse results = await mySqldb
        .table('customer')
        .record(customer.coa_uuid, column: 'coa_uuid')
        .update(customer.toMap());

    if (results.statusCode == 0) {
      showErrorSnackbar(message: 'Update Unsuccessful');
    }
    showSuccessSnackbar(message: "Data Updated Successfully");
    await getAllCutomers();
  }

  updateCustomer(CustomerModel customerM) {
    print(customerM.toMap());
  }
}
