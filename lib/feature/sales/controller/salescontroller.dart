
import 'package:get/get.dart';
import 'package:storekepper_desktop/shared/ui/snackbars.dart';

import '../models/salesitem.dart';

class SalesController extends GetxController{
  var salesItem = <SalesItem>[].obs;

  var balance = 0.0.obs;
  var completed = false.obs;
  
  
  double totalAmount(){
    double x = 0;
    for (var item in salesItem) {
      x=x+item.salesprice*item.quantity;
    }
    return x;
  }


  addSalesItem(SalesItem element){
    if(salesItem.value.where((e)=>e.uuid ==element.uuid).isNotEmpty){
      showErrorSnackbar(message: "Item already in list");
    }else{
    salesItem.add(element);
    }
  }
  removeSalesItem(SalesItem element){
    salesItem.remove(salesItem.firstWhere((test)=>test.uuid==element.uuid));
  }

}