import 'dart:convert';
import 'package:ocean_publication/ui/screens/cart/cart_viewmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class CartService {
  final String tableName = 'cart';
  Database? database;
  Future openDB() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'cart.db'),
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            author TEXT,
            price INTEGER,
            type Text,
            image TEXT,
            quantity INTEGER
            )''',
        );
      },
      version: 2,
    );
  }

  Future<void> addToDB(CartItem item) async {
    //
    bool canAdd = true;
    if (database == null) {
      await openDB();
    }
    List<CartItem> products = [];
    var data = await database!.query(tableName);
    for (var p in data) {
      products.add(cartItemFromMap(jsonEncode(p)));
    }

    for (int i = 0; i < products.length; i++) {
      if (item.id == products[i].id) {
        canAdd = false;
      }
    }

    if (canAdd == true) {
      var map = item.toMap();
      print(jsonEncode(map));
      await database!.insert(tableName, map);
    }
  }

  Future<List<CartItem>> getFromDB() async {
    //
    if (database == null) {
      await openDB();
    }
    var data = await database!.query(tableName);

    List<CartItem> products = [];
    for (var p in data) {
      products.add(cartItemFromMap(jsonEncode(p)));
    }

    return products;
  }

  Future<void> deleteFromDB(int id) async {
    //
    if (database == null) {
      await openDB();
    }
    await database!.delete(tableName, where: "id=?", whereArgs: [id]);
  }
}
