

import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/people/models/customer_model.dart';
import 'package:storekepper_desktop/feature/people/models/supplier_model.dart';

class PeopleController extends GetxController {
  var customerType = [
    {"name":"Single"},{"name":"Company"}
  ].obs;

  addCustomer({required CustomerModel data}) {

  }

  addSupplier({required SupplierModel data}) {}

}