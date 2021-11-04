import 'dart:io';

import 'package:machine_test/modal/api_model/model.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'product_details.db');
    print("Path taking ready");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE PRODUCTS('
          'brand TEXT,'
          'catergory TEXT,'
          'option TEXT,'
          'mrp INTEGER PRIMARY KEY,'
          'colection TEXT,'
          'qrCode TEXT,'
          'ean TEXT,'
          'imageUrl TEXT,'
          'technologyImageUrl TEXT'
          'likeability TEXT,'
          ')');
    });
  }

  // Insert data on database

  createEmployee(ProductMODAL newProduct) async {
    // await deleteAllEmployees();
    print("object");
    final db = await database;
    print("object2");
    final res = await db!.insert('PRODUCTS', newProduct.toMap());
    print("object3");
    print(await db.rawQuery("SELECT * FROM PRODUCTS"));

    return res;
  }

  // Delete all data
  Future<int> deleteAllEmployees() async {
    final db = await database;
    final res = await db!.rawDelete('DELETE FROM PRODUCTS');

    return res;
  }

  Future<List<ProductMODAL>> getAllEmployees() async {
    final db = await database;

    final res = await db!.rawQuery("SELECT * FROM PRODUCTS");

    List<ProductMODAL> list =
        res.isNotEmpty ? res.map((c) => ProductMODAL.fromMap(c)).toList() : [];
    print(list);
    return list;
  }
}
