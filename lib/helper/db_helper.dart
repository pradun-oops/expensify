// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper getInstance() => DbHelper._();

  static const String USER_TABLE = 'user_table';
  static const String USER_ID = 'user_id';
  static const String USER_NAME = 'user_name';
  static const String USER_EMAIL = 'user_email';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_MOBILE = 'user_mobile';

  static const String EXPENSE_TABLE = 'expense_table';
  static const String EXPENSE_ID = 'expense_id';
  static const String EXPENSE_TITLE = 'expense_title';
  static const String EXPENSE_DESCRIPTION = 'expense_description';
  static const String EXPENSE_DATE = 'expense_date';
  static const String EXPENSE_AMOUNT = 'expense_amount';
  static const String EXPENSE_BALANCE = 'expense_balance';
  static const String EXPENSE_TYPE = 'expense_type';
  static const String EXPENSE_CATEGORY = 'expense_category';

  Database? _db;

  Future<Database> getDB() async {
    _db ??= await openDb();
    return _db!;
  }

  Future<Database> openDb() async {
    Directory appDocDir = await getApplicationCacheDirectory();
    String dbPath = join(appDocDir.path, 'expenseDb.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $USER_TABLE (
          $USER_ID TEXT PRIMARY KEY AUTOINCREMENT,
          $USER_NAME TEXT NOT NULL,
          $USER_EMAIL TEXT NOT NULL,
          $USER_PASSWORD TEXT NOT NULL,
          $USER_MOBILE TEXT
        )
      ''');

        await db.execute('''
        CREATE TABLE $EXPENSE_TABLE (
          $EXPENSE_ID INTEGER PRIMARY KEY AUTOINCREMENT,
          $EXPENSE_TITLE TEXT NOT NULL,
          $EXPENSE_DESCRIPTION TEXT,
          $EXPENSE_DATE TEXT NOT NULL,
          $EXPENSE_AMOUNT REAL NOT NULL,
          $EXPENSE_BALANCE REAL,
          $EXPENSE_TYPE TEXT NOT NULL,
          $EXPENSE_CATEGORY TEXT NOT NULL,
          FOREIGN KEY ($USER_ID) REFERENCES $USER_TABLE($USER_ID) ON DELETE CASCADE
        )
      ''');
      },
    );
  }
}
