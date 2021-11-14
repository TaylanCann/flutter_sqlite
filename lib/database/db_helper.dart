import 'dart:async';
import 'dart:io';

import 'package:flutter_sqlite/model/product_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

///This Helper created for Sqlite. If you will use sqlite for mobile you can use this helper.
///You should use last versions Sqflite and path_provider.

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();

  ///Tablo ve columnlar tanımlanır

  ///Product
  String tblProduct = "product";
  String colId = "id";
  String colName = "name";
  String colBarcode = "barcode";
  String colAmount = "amount";
  String colExplanation = "explanation";

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  ///Database tanıtılır.
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    ///Database'in gömüleceği kök klasör çekilir.
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "Database.db";
    var dbProducts = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbProducts;
  }

  void _createDb(Database db, int newVersion) async {
    ///Tablo oluşturulur.
    await db.execute(
        "CREATE TABLE $tblProduct($colId INTEGER PRIMARY KEY, $colName TEXT,$colBarcode TEXT, $colAmount REAL, $colExplanation TEXT)");
  }

  //todo adam akıllı fonksiyon

  Future<int?> insertProduct(Product product) async {
    Database? db = await this.db;
    var result = await db?.insert(tblProduct, product.toMap());
    return result;
  }

  Future<int?> getCountProduct() async {
    Database? db = await this.db;
    var result = Sqflite.firstIntValue(
        await db!.rawQuery("SELECT COUNT(*) FROM $tblProduct"));
    return result;
  }

  Future<List<Product>> getItemsProducts() async {
    List<Product> product = [];
    Database? db = await this.db;
    var result = await db?.rawQuery("SELECT * FROM $tblProduct");
    result?.forEach((element) {
      product.add(Product.fromObject(element));
    });
    return product;
  }

  Future<int?> updateProduct(Product product) async {
    Database? db = await this.db;
    var result = await db?.update(tblProduct, product.toMap(),
        where: "$colId = ?", whereArgs: [product.id]);
    return result;
  }

  Future<int?> deleteProduct(int id) async {
    Database? db = await this.db;
    var result =
        await db?.delete(tblProduct, where: "$colId = ?", whereArgs: [id]);
    return result;
  }
}
