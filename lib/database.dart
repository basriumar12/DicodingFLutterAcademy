import 'dart:io';

import 'package:flutter_app/model/meal.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Food.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Meal ("
              "id INTEGER PRIMARY KEY,"
              "idMeal  TEXT,"
              "strMeal TEXT,"
              "strMealThumb TEXT,"
              "strInstructions TEXT,"
              "type INTEGER"
              ")");
        });
  }

  newMeal(Meal data) async {
    final db = await database;
    var res = await db.insert("Meal", data.toMap());
    return res;
  }

  Future<List<Meal>> getDataDessert(int type) async {
    final db = await database;
    var res = await db.query("Meal", where: "type = ?", whereArgs: [type]);
    return res.isNotEmpty ? res.map((c) => Meal.fromMap(c)).toList() : [];
  }

  Future<List<Meal>> getDataBreakfast(int type) async {
    final db = await database;
    var res = await db.query("Meal", where: "type = ?", whereArgs: [type]);
    return res.isNotEmpty ? res.map((c) => Meal.fromMap(c)).toList() : [];
  }

  getData(String id) async {
    final db = await database;
    var res = await db.query("Meal", where: "idMeal = ?", whereArgs: [id]);
    return res.isEmpty ? null : Meal.fromMap(res.first);
  }

  deleteMeal(String id) async {
    final db = await database;
    return db.delete("Meal", where: "idMeal = ?", whereArgs: [id]);
  }
}