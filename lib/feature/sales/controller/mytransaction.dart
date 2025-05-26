import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlbase/sqlbase.dart';

import '../../sqlite_db.dart';
import '../models/transaction.dart';

class MyTransactionController extends GetxController{
  final DatabaseX database = DatabaseX();
  final Sqlbase mySqldb = Sqlbase();
  Future<bool> saveTransaction(MyTransaction transaction) async{

    //var dbClient = await database.db;
   SqlBaseResponse respose = await mySqldb.table('trn_inventory').addMany(transaction.inventory!.map((element)=>element.toMap()).toList());
   SqlBaseResponse respose1 = await mySqldb.table('trn_accounting').addMany(transaction.accounting!.map((element)=>element.toMap()).toList());
   SqlBaseResponse respose2 = await mySqldb.table('voucher').add(transaction.voucher.toMap());
    // int results= await dbClient!.transaction((action)async{
    //   Batch batch = action.batch();
    //
    //   batch.insert('voucher', transaction.voucher.toMap());
    //   for(var item in transaction.accounting!){
    //     batch.insert('trn_accounting', item.toMap());
    //   }
    //
    //   for(var item in transaction.inventory!){
    //     batch.insert('trn_inventory', item.toMap());
    //   }
    //   await batch.commit(noResult: true);
    //   return 1;
    // });
    return true;
    // if(results==1) return true;
    // return false;
  }
}