import 'package:sqlbase/sqlbase.dart';
final mydb = Sqlbase();

final SqlTable businessDB = mydb.table('business');
final SqlTable storeDB = mydb.table('stores');
final SqlTable userstoreDB = mydb.table('user_store');
final SqlTable userbusinessDB = mydb.table('user_business');
final SqlTable users = mydb.table('users');
final SqlTable stockItemDB = mydb.table('stock_item');
final SqlTable categoryDB = mydb.table('stock_item_category');
final SqlTable groupDB = mydb.table('stock_item_group');
final SqlTable unitDB = mydb.table('stock_item_unit');
final SqlTable voucherDB = mydb.table('voucher');
