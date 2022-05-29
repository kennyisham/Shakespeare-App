
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static const _databaseName = 'shakespeare_translate.db';
  static const _databaseVersion=1;
  //static final table = '';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async =>
      _database ??= await _initDatabase();

  _initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);

    var exists = await databaseExists(path);
    if(!exists){
      print('Copy database');
      try{
        await Directory(dirname(path)).create(recursive: true);
      }catch (_) {}

      ByteData data = await rootBundle.load(join('assets', _databaseName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);

      await File(path).writeAsBytes(bytes,flush: true);
    }else{
      print('Opening existing database');
    }

    return await openDatabase(path,version: _databaseVersion);
  }

  //SELECT ALL
  Future<List> getAll(String table) async{
      Database db = await instance.database;
      var result = await db.query(table);

      return result.toList();
  }

  //SELECT Where
  Future<List> getAllWhere(String table, String where) async{
    Database db = await instance.database;
    var result = await db.rawQuery("Select * from $table $where");

    return result.toList();
  }

}