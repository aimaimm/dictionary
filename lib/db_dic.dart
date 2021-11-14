import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class db_dic {
  late Database _db;
  String dbfile = 'lexitron.sqlite';

  void openDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, dbfile);
    bool exits = await databaseExists(path);

    if (!exits) {
      print('No DB');
      try {
        Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print('Error: cannot create folder');
      }

      ByteData data = await rootBundle.load(join('assets/db', dbfile));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
      print('Copy DB OK');
    }

    else{
      print('Use existing DB');
    }

    _db = await openDatabase(path, readOnly: true, singleInstance:true );
  }


  void getDataeng2th() async {
   List resulteng2th = await _db.rawQuery('SELECT * FROM eng2th WHERE esearch = "aback"');
   print(resulteng2th);
  }

  void getDatath2eng() async {
    List resultth2eng = await _db.rawQuery('SELECT * FROM th2eng WHERE tsearch = "เอเชีย"');
    print(resultth2eng);
  }


  void closeDB () async {
    await _db.close();
    print('DB Closed');
  }
}
