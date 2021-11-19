import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class db_dic {
  late Database _db;
  late List resulteng2th;
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
    } else {
      print('Use existing DB');
    }

    _db = await openDatabase(path, readOnly: true, singleInstance: true);
  }

  getDataeng2th() async {
    resulteng2th =
        await _db.rawQuery('SELECT * FROM eng2th WHERE esearch = "aback"');
    return resulteng2th;
  }

  test(value) async {
    List<Map> res =
        await _db.rawQuery("SELECT * FROM eng2th WHERE eentry LIKE '%$value%'");
    // print("1 $res");
    return res;
  }

  getAllDataEng2th() async {
    List data = await _db.rawQuery('SELECT * FROM eng2th');
    return data;
  }

  getAllDatath2Eng() async {
    List data = await _db.rawQuery('SELECT * FROM th2eng');
    return data;
  }

  void getDatath2eng() async {
    List resultth2eng =
        await _db.rawQuery('SELECT * FROM th2eng WHERE tsearch = "เอเชีย"');
    // print(resultth2eng);
  }

  wordofthedayeng2th() async {
    List wordofdaythedayeng2th =
        await _db.rawQuery('SELECT * FROM eng2th ORDER BY RANDOM() LIMIT 1');
    return wordofdaythedayeng2th;
  }

  worofthedayth2eng() async {
    List wordofthedayth2eng =
        await _db.rawQuery('SELECT * FROM th2eng ORDER BY RANDOM() LIMIT 1');
    return wordofthedayth2eng;
  }

  void closeDB() async {
    await _db.close();
    print('DB Closed');
  }
}
