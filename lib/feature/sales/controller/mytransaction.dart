import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlbase/sqlbase.dart';

import '../../sqlite_db.dart';
import '../models/transaction.dart';

class MyTransactionController extends GetxController {
  final DatabaseX database = DatabaseX();
  final Sqlbase mySqldb = Sqlbase();

  Future<bool> saveTransaction(MyTransaction transaction) async {
    //
    //  // var dbClient = await database.db;
    // SqlBaseResponse respose = await mySqldb.table('trn_inventory').addMany(transaction.inventory!.map((element)=>element.toMap()).toList());
    // SqlBaseResponse respose1 = await mySqldb.table('trn_accounting').addMany(transaction.accounting!.map((element)=>element.toMap()).toList());
    // SqlBaseResponse respose2 = await mySqldb.table('voucher').add(transaction.voucher.toMap());

  SqlBaseResponse data =  await mySqldb.transaction((batch) {
      batch.start();
      batch.add('voucher', transaction.voucher.toMap());
      batch.addMany('trn_accounting',
          transaction.accounting!.map((e) => e.toMap()).toList());
      batch.addMany('trn_inventory',
          transaction.inventory!.map((e) => e.toMap()).toList());
      return batch;
    });

  print(data.toString());

    return true;
  }
}
