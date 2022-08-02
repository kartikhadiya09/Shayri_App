import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

class EXDB {
  Database? database;

  Future<Database> chek() async {
    if (database != null) {
      return database!;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(),"QuotesDatabase.sqlite");
    if (!(await databaseExists(path))) {
      ByteData data = await rootBundle
          .load(join("assets/db","QuotesDatabase.sqlite"));
      List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }
    return openDatabase(path, version: 1);
  }
  Future<List<Map<String,dynamic>>> redData()async{
    database = await chek();
    String query = "SELECT * FROM categorytable";
    print("$query");

    return await database!.rawQuery(query);

  }

  Future<List<Map<String,dynamic>>> redSay(String id)async{
    database = await chek();
    String query = "SELECT * FROM quotestable WHERE catid = $id";
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++$query");

    return await database!.rawQuery(query);

  }

  Future<List<Map<String,dynamic>>> redFav()async{
    database = await chek();
    String query = "SELECT * FROM favoritetable";
    print("$query");

    return await database!.rawQuery(query);

  }
}
