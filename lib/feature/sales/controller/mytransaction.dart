import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sqflite/sqflite.dart';

import '../../items/data/local/sqlite_db.dart';
import '../models/transaction.dart';

class MyTransactionController extends GetxController{
  final DatabaseX database = DatabaseX();
  saveTransaction(MyTransaction transaction) async{
    var dbClient = await database.db;
    int results= await dbClient!.transaction((action)async{
      Batch batch = action.batch();

      batch.insert('voucher', transaction.voucher.toMap());
      for(var item in transaction.accounting!){
        batch.insert('trn_accounting', item.toMap());
      }

      for(var item in transaction.inventory!){
        batch.insert('trn_inventory', item.toMap());
      }
      await batch.commit(noResult: true);
      return 1;
    });
    if(results==1) return true;
    return false;
  }
}