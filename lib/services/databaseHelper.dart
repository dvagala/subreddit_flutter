import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:subreddit_flutter/constants.dart';
import 'package:subreddit_flutter/models/post.dart';

class DatabaseHelper {
  static final _databaseName = "postsDb.db";
  static final _databaseVersion = 1;

  static final table = 'posts';

  static final columnId = '_id';
  static final columnTitle = 'title';
  static final columnContent = 'content';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnTitle TEXT NOT NULL,
            $columnContent TEXT 
          )
          ''');
  }

  Future insertPosts(List<Post> posts) async {
    try {
      Database db = await instance.database;
      Batch batch = db.batch();

      batch.delete(table);

      for (var post in posts) {
        batch.insert(
            table, {columnTitle: post.title, columnContent: post.content});
      }

      return await batch.commit(noResult: true);
    } catch (e) {
      return Future.error(Constants.DATABASE_INSERT_ERROR_MSG);
    }
  }

  Future<List<Post>> getAllPosts() async {
    try {
      Database db = await instance.database;
      List<Map<String, dynamic>> allRows = await db.query(table);

      if (allRows.isEmpty) {
        return Future.error(Constants.NO_INTERNET_ERROR_MSG);
      }

      return allRows
          .map((row) =>
              Post(title: row[columnTitle], content: row[columnContent]))
          .toList();
    } catch (e) {
      return Future.error(Constants.NO_INTERNET_ERROR_MSG);
    }
  }
}
