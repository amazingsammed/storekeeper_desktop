

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseX {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "StoreApp.db");
    bool dbExists = await File(path).exists();


    if (!dbExists) {

      print("Creating New Database");
      ByteData data = await rootBundle.load("assets/mystore_db.db");
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);

    }
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    var theDb = await openDatabase(
        path
    );
    return theDb;
  }
}