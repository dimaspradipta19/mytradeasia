import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/biodata_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializedDb();
    return _database;
  }

// create database
  final String _tableName = "biodata";
  Future<Database> _initializedDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), "biodata_db.db"),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, companyName TEXT, country TEXT, password TEXT, uid TEXT)''',
        );
      },
      version: 1,
    );
    return db;
  }

  //insert data to tabel in database
  Future<void> insertBiodata(BiodataModel biodataModel) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      biodataModel.toMap(),
    );
  }

  // read data from tabel
  Future<List<BiodataModel>> getBiodata() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableName);
    return result.map((e) => BiodataModel.fromMap(e)).toList();
  }

  //get biodata by id
  Future<BiodataModel> getBiodataById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => BiodataModel.fromMap(e)).first;
  }

  // get biodata by uid
  Future<BiodataModel> getBiodataByUid(String uid) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'uid = ?',
      whereArgs: [uid],
    );
    return results.map((e) => BiodataModel.fromMap(e)).first;
  }

  // delete biodata
  Future<void> deleteBiodata(int id) async {
    final Database db = await database;
    await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
