
import 'package:get/get.dart';

import '../models/salesitem.dart';

class SalesController extends GetxController{
  var salesItem = <SalesItem>[].obs;


  addSalesItem(SalesItem element){
    salesItem.add(element);
  }

}